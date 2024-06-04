print_app_name :-
    writeln('  _____             _______        _      __  __                                    '),
    writeln(' |  __ \\           |__   __|      | |    |  \\/  |                                   '),
    writeln(' | |__) | __ ___      | | __ _ ___| | __ | \\  / | __ _ _ __   __ _  __ _  ___ _ __ '),
    writeln(' |  ___/ \'__/ _ \\     | |/ _` / __| |/ / | |\\/| |/ _` | \'_ \\ / _` |/ _` |/ _ \\ \'__|'),
    writeln(' | |   | | | (_) |    | | (_| \\__ \\   <  | |  | | (_| | | | | (_| | (_| |  __/ |   '),
    writeln(' |_|   |_|  \\___/     |_|\\__,_|___/_|\\_\\ |_|  |_|\\__,_|_| |_|\\__,_|\\__, |\\___|_|   '),
    writeln('                                                                    __/ |           '),
    writeln('                                                                   |___/            ').

print_sign :-
    writeln('   ______            _     __                 __                  __    _ '),
    writeln('  / __/ /____ ____  (_)__ / /__ __    __  __ / /__ ________  ____/ /__ (_)'),
    writeln(' _\\ \\/ __/ _ `/ _ \\/ (_-</ / _ `/ |/|/ / / // / _ `/ __/ _ \\/ __/  \'_// / '),
    writeln('/___/\\__/\\_,_/_//_/_/___/_/\\_,_/|__,__/  \\___/\\_,_/_/  \\___/\\__/_/\\_\\/_/  '),
    writeln('                                                                          ').

% --- greeting ---
greeting :- print_app_name, nl,
    print_sign, nl,
    write('Witaj w systemie eksperckim do zarzadzania zadaniami w zespole!'), nl,
    write('Aby uzyskac pomoc wpisz: >> ui:pomoc. <<'), nl, nl.

% :- working_directory(_, "c:/users/lenovo/code/prolog_expert/"),
:-  use_module('database.pl'),
    use_module('expert.pl'),
    use_module('ui.pl'),
    greeting.
