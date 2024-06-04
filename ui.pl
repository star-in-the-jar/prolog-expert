:- module(ui, [cls/0, display_people/0, display_skills/0, display_working_time/1, display_sprints/0, pomoc/0]).

% --- clear screen ---
cls :- write('\33\[2J').

% --- pomoc ---
pomoc :-
    write('============ HELP ============'), nl, nl,
    write('--- expert commands'), nl,
    write('display_tasks(Tasks). - display every info of the task in the list (by id)'), nl,
    write('display_sprint_tasks(Sprint, Person). - display task info by sprint and person'), nl,
    write('display_active_sprint_tasks(Person). - display tasks in the active sprint for the person'), nl,
    write('display_best_tasks_for_person(Person). - considering skills needed for the task, display tasks that fit the person best'), nl,
    write('free_time(Person, Time). - check how much time Person has left in the active sprint'), nl,
    write('get_current_date(Date). - get current date in format MM_DD'), nl,
    write('story_points_to_hours(StoryPoints, Hours) - sum story points to hours'), nl,
    write('--- available commands'), nl,
    write('cls. - clear screen'), nl,
    write('pomoc. - show this screen'), nl, nl,
    write('--- available facts'), nl,
    write('Lists'), nl,
    write('\tdisplay_people. - display all people in the team'), nl,
    write('\tdisplay_skills. - display all skills in the team'), nl,
    write('\tdisplay_working_time. - display working time of all people in the team'), nl,
    write('\tdisplay_sprints. - display all sprints'), nl, nl,
    write('Most important'), nl,
    write('\tworking_time(Person, Time). - check how much time Person is working (1.00 = 160h/month)'), nl,
    write('\tsprint(Name, From, To). - check name, beginning and end of the agile sprint'), nl,
    write('\tperson(Person). - check person in the team'), nl,
    write('\ttask(Id, Time, Name, StoryPoints, Status, Sprint). - check task info'), nl.

% --- database read ---
display_people :-
    write('person:'), nl,
    findall(Person, person(Person), People),
    write(People), nl.

display_skills :-
    write('Skills:'), nl,
    write('basic: '), findall(Person, basic(Person), Basic), write(Basic), nl,
    write('ux: '), findall(Person, ux(Person), UX), write(UX), nl,
    write('backend: '), findall(Person, backend(Person), Backend), write(Backend), nl,
    write('frontend: '), findall(Person, frontend(Person), Frontend), write(Frontend), nl,
    write('devops: '), findall(Person, devops(Person), DevOps), write(DevOps), nl,
    write('planning: '), findall(Person, planning(Person), Planning), write(Planning), nl,
    write('clients: '), findall(Person, clients(Person), Clients), write(Clients), nl.

display_working_time(Person) :-
    write('working_time:'), nl,
    findall(WorkingTime, working_time(Person, WorkingTime), WorkingTimes),
    write(WorkingTimes), nl.

display_sprints :-
    write('sprint:'), nl,
    findall(Sprint, sprint(Sprint, _, _), Sprints),
    write(Sprints), nl.
