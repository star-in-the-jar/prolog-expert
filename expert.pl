:- module(
    expert, [
        get_current_date/1,
        date_to_number/2,
        during_sprint/2,
        active_sprint/1,
        sprint_tasks/3,
        active_sprint_tasks/2,
        display_tasks/1,
        story_points_to_hours/2,
        story_points_to_hours_list/2,
        active_sprint_occupancy/2,
        active_sprint_free_time/2,
        display_active_sprint_free_time/1,
        best_person_for_task/2,
        display_best_tasks_for_person/1
    ]
).

% gets current date in format MM_DD
get_current_date(Date) :-
    get_time(Now),
    format_time(atom(Date), '%m_%d', Now).

% converts date in format MM_DD to number, e.g. 05_02 -> 502 (so it can be compared)
date_to_number(MM_DD, Number) :-
    split_string(MM_DD, "_", "", [MM, DD]),
    atom_number(MM, MMNumber),
    atom_number(DD, DDNumber),
    Number is MMNumber * 100 + DDNumber.

% converts number to date in format MM_DD, e.g. 502 -> 05_02
number_to_date(Number, MM_DD) :-
    MM is Number // 100,
    DD is Number mod 100,
    atom_string(MM, MMString),
    atom_string(DD, DDString),
    string_concat(MMString, "_", MM_),
    string_concat(MM_, DDString, MM_DD).

% checks what sprint is active during given date
during_sprint(Sprint, Time) :-
    sprint(Sprint, StartNumber, EndNumber),
    date_to_number(Time, TimeNumber),
    TimeNumber >= StartNumber,
    TimeNumber =< EndNumber.

% checks active sprint
active_sprint(Sprint) :-
    get_current_date(Today),
    sprint(Sprint, _, _),
    during_sprint(Sprint, Today).

% checks tasks in the given sprint. By assignee
sprint_tasks(Sprint, TasksIds, Person) :-
    findall(Id, task(Id, _, _, _, Sprint, Person), TasksIds).

% checks tasks in the active sprint. By assignee
active_sprint_tasks(TasksIds, Person) :-
    active_sprint(Sprint),
    sprint_tasks(Sprint, TasksIds, Person).

% sum story points to hours
story_points_to_hours(StoryPoints, Hours) :-
    story_points_worktime(StoryPoints, Hours).

% list of story points to hours
story_points_to_hours_list([], []).
story_points_to_hours_list([StoryPoints | Tail], [Hours | HoursTail]) :-
    story_points_worktime(StoryPoints, Hours),
    story_points_to_hours_list(Tail, HoursTail).

% checks tasks in the active sprint. For all assignees
active_sprint_occupancy(Person, Sum) :-
    active_sprint_tasks(TasksIds, Person),
    findall(StoryPoints, (member(TaskId, TasksIds), task(TaskId, _, StoryPoints, _, _, _)), TaskTimes),
    story_points_to_hours_list(TaskTimes, TaskTimesHours),
    sum_list(TaskTimesHours, Sum).

working_time_to_hours(WorkingTime, Hours) :-
    Hours is WorkingTime * 160.

% checks how much time Person has left in the active sprint (considering working time and assigned tasks)
active_sprint_free_time(Person, Time) :-
    working_time(Person, WorkingTime),
    active_sprint_occupancy(Person, Occupancy),
    working_time_to_hours(WorkingTime, WorkingTimeHours),
    Time is WorkingTimeHours - Occupancy.

% find the best person for the task
best_person_for_task(TaskId, Person) :-
    task(TaskId, _, _, _, _, _),
    skills_needed_for_task(TaskId, Skills),
    findall(Person, (person(Person), forall(member(Skill, Skills), call(Skill, Person))), People),
    findall(Time, (member(Person, People), active_sprint_free_time(Person, Time)), Times),
    min_list(Times, MinTime),
    member(Person, People),
    active_sprint_free_time(Person, MinTime).

% --- display tasks ---

display_active_sprint_free_time(Person) :-
    active_sprint_free_time(Person, Time),
    write('Free time in the active sprint: '), write(Time), write('h'), nl.

% display every info of the task in the list (by id)
display_tasks(Tasks) :-
    nl,
    write('Id\tName\t\t\t\tStoryPoints\tStatus\t\t\tSprint\t\t\tAssignee'), nl,
    display_task_info(Tasks).

% helper function for display_tasks
display_task_info([Id | IdTail]) :-
    task(Id, Name, StoryPoints, Status, Sprint, Assignee),
    write(Id), write('\t'),
    write(Name), write('\t\t'),
    write(StoryPoints), write('\t\t'),
    write(Status), write('\t\t'),
    write(Sprint), write('\t\t'),
    write(Assignee), nl,
    display_task_info(IdTail).

% display task info by sprint and person
display_sprint_tasks(Sprint, Person) :-
    sprint_tasks(Sprint, TasksIds, Person),
    display_tasks(TasksIds).

% display tasks in the active sprint for the person
display_active_sprint_tasks(Person) :-
    active_sprint(Sprint),
    display_sprint_tasks(Sprint, Person).

% considering skills needed for the task, display tasks that fit the person best
display_best_tasks_for_person(Person) :-
    best_person_for_task(TaskId, Person),
    write('Task: '), write(TaskId), write(' is best for '), write(Person), nl,
    fail.