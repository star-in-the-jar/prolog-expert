:- module(database, [person/1, basic/1, ux/1, backend/1, frontend/1, devops/1, planning/1, clients/1, working_time/2, sprint/3, task/6, story_points_worktime/2, skills_needed_for_task/2]).
%  --- People ---
person(adrianna_suchomska).
person(anna_gasiorowska).
person(barbara_darowska).
person(erwin_maciejewski).
person(joanna_krzysiek).
person(maciej_krasny).
person(marcin_depcik).
person(stanislaw_jarocki).
person(wiktor_pilak).

% --- Skills ---
basic(maciej_krasny).
basic(stanislaw_jarocki).
basic(erwin_maciejewski).
basic(anna_gasiorowska).
basic(marcin_depcik).
basic(barbara_darowska).
basic(adrianna_suchomska).

ux(joanna_krzysiek).

backend(anna_gasiorowska).
backend(wiktor_pilak).
backend(barbara_darowska).
backend(marcin_depcik).
backend(stanislaw_jarocki).

frontend(adrianna_suchomska).
frontend(anna_gasiorowska).
frontend(barbara_darowska).
frontend(erwin_maciejewski).
frontend(marcin_depcik).
frontend(stanislaw_jarocki).

devops(marcin_depcik).
devops(stanislaw_jarocki).

planning(maciej_krasny).
planning(stanislaw_jarocki).
planning(wiktor_pilak).

clients(adrianna_suchomska).
clients(barbara_darowska).
clients(maciej_krasny).

% working_time(person, time)
working_time(adrianna_suchomska, 1).
working_time(anna_gasiorowska, 1/2).
working_time(barbara_darowska, 1).
working_time(erwin_maciejewski, 1).
working_time(marcin_depcik, 1).
working_time(stanislaw_jarocki, 3/4).
working_time(wiktor_pilak, 1/2).

% sprint(name, from, to). also kinda like epic - main focus of the agile sprint. Name includes startdate
sprint(tenants_isolate, 05_02, 05_09).
sprint(passwd_manager, 04_24, 05_01).
sprint(rpa_03_26, 03_26, 04_09).
sprint(roboticSyntax,04_09, 04_23).
sprint(modeler_bpmn, 05_10, 05_17).
sprint(marketing, 05_18, 05_25).
sprint(collections, 05_25, 06_01).
sprint(ai_section, 06_02, 06_09).

% task(id,      name,                   story_points, status, sprint, assignee).
task(rpa_1,     kolejkowanie_procesow,  5, already_done, rpa_03_26, marcin_depcik).
task(rpa_2,     udostepnianie_kolekcji, 2, already_done, collections, stanislaw_jarocki).
task(rpa_3,     optymalizacja_zapytan,  3, is_being_tested, collections, anna_gasiorowska).
task(rpa_4,     webinar_automatyzacja,  2, ready_for_test, collections, adrianna_suchomska).
task(rpa_5,     testy_jednostkowe,      3, code_review, collections, maciej_krasny).
task(rpa_6,     warsztaty_z_millenium,  2, in_progress, marketing, maciej_krasny).
task(rpa_7,     drag_and_drop_kolekcji, 5, in_progress, collections, stanislaw_jarocki).
task(rpa_8,     warsztaty_z_cropp,      3, not_started, marketing, adrianna_suchomska).
task(rpa_9,     drag_and_drop_akcji,    8, not_started, modeler_bpmn, marcin_depcik).
task(rpa_10,    testy_bezpieczenstwa,   5, not_started, modeler_bpmn, stanislaw_jarocki).
task(rpa_11,    akcje_sharepointowe,    3, not_started, modeler_bpmn, adrianna_suchomska).
task(rpa_12,    python_interpreter,     5, not_started, modeler_bpmn, anna_gasiorowska).
task(rpa_13,    ai_all_platform_chat,   5, in_progress, ai_section, marcin_depcik).
task(rpa_15,    kontekst_procesu,       1, not_started, passwd_manager, wiktor_pilak).
task(rpa_16,    debugger_procesu,       13, not_started, modeler_bpmn, stanislaw_jarocki).
task(rpa_17,    zakladka_tenantow,      5, in_progress, tenants_isolate, anna_gasiorowska).

% story_points_worktime(story_points, hours).
story_points_worktime(1, 2).
story_points_worktime(2, 8).
story_points_worktime(3, 16).
story_points_worktime(5, 30).
story_points_worktime(8, 60).
story_points_worktime(13, 80).

% skills_needed_for_task(task, [skills]).
skills_needed_for_task(rpa_1, [backend, devops]).
skills_needed_for_task(rpa_2, [backend, frontend]).
skills_needed_for_task(rpa_3, [frontend, devops]).
skills_needed_for_task(rpa_4, [ux]).
skills_needed_for_task(rpa_5, [clients, basic]).
skills_needed_for_task(rpa_6, [basic, frontend]).
skills_needed_for_task(rpa_7, [basic, devops]).
skills_needed_for_task(rpa_8, [basic, backend]).
skills_needed_for_task(rpa_9, [backend, devops]).
skills_needed_for_task(rpa_10, [basic, frontend]).
skills_needed_for_task(rpa_11, [basic, frontend]).
skills_needed_for_task(rpa_12, [basic]).
skills_needed_for_task(rpa_13, [basic, clients]).
skills_needed_for_task(rpa_15, [planning]).
skills_needed_for_task(rpa_16, [basic]).
skills_needed_for_task(rpa_17, [basic]).
