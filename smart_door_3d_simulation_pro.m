function smart_door_3d_simulation()
    correct_pin = [1 2 3 4];
    max_attempts = 3;
    attempt = 0;
    access_granted = false;

    disp('Welcome to the Smart Entry/Exit System');

    % Initialize door, walls, and variables before PIN entry
    [left_door, right_door, door_y, left_wall, right_wall, top_wall, wall_height, Z_door, Z_wall] = initialize_sideways_door();

    while attempt < max_attempts && ~access_granted
        attempt = attempt + 1;
        fprintf('\nAttempt %d of %d\n', attempt, max_attempts);

        entered_pin = zeros(1,4);
        for i = 1:4
            entered_pin(i) = input(sprintf('Enter digit %d of 4: ', i));
        end

        if isequal(entered_pin, correct_pin)
            disp('✅ Access Granted. Opening Door...');
            play_ring_sound();
            access_granted = true;
            animate_sideways_door(true, left_door, right_door, door_y, left_wall, right_wall, top_wall, wall_height);
        else
            disp('❌ Access Denied. Wrong PIN!');
            play_buzzer_sound();
            if attempt < max_attempts
                disp('Please try again.');
            end
        end
    end

    if ~access_granted
        disp('!!! SYSTEM LOCKED - Too many failed attempts !!!');
    end
end

function play_ring_sound()
    load handel
    sound(y, Fs);
end

function play_buzzer_sound()
    load laughter
    sound(y, Fs);
end

function [left_door, right_door, door_y, left_wall, right_wall, top_wall, wall_height, Z_door, Z_wall] = initialize_sideways_door()
    figure('Name', '2D Smart Entry/Exit System', 'NumberTitle', 'off');
    axis equal;
    axis([0 4 0 4 -1 1]);
    view(0, 90);  % 2D front view
    grid on;
    hold on;
    title('Smart Entry/Exit System');

    Z_door = 0.01;
    Z_wall = 0.02;  % Walls slightly in front

    wall_height = 3;
    door_height = 2;
    wall_color = [0.8 0.8 0.8];

    % Door panels height
    door_y = [0 0 door_height door_height];

    % Fixed wider gap walls
    left_wall_x = [0 1.3 1.3 0];   
    right_wall_x = [2.7 4 4 2.7];  
    top_wall_x = [1.3 2.7 2.7 1.3];

    left_wall = fill3(left_wall_x, [0 0 wall_height wall_height], Z_wall*ones(1,4), wall_color);
    right_wall = fill3(right_wall_x, [0 0 wall_height wall_height], Z_wall*ones(1,4), wall_color);
    top_wall = fill3(top_wall_x, [door_height door_height wall_height wall_height], Z_wall*ones(1,4), wall_color);

    % Door panels (left and right)
    door_mid = (1.3 + 2.7)/2;  % 2.0

    left_x = [1.3 2.0 2.0 1.3];
    left_door = fill3(left_x, door_y, Z_door*ones(1,4), 'r');

    right_x = [2.0 2.7 2.7 2.0];
    right_door = fill3(right_x, door_y, Z_door*ones(1,4), 'r');
end

function animate_sideways_door(access_granted, left_door, right_door, door_y, ~, ~, ~, ~)
    total_time = 5;
    steps_count = 100;
    pause_time = total_time / steps_count;

    extra_gap = 0.9;  % How far doors slide sideways

    persistent orig_left_x orig_right_x;

    if isempty(orig_left_x)
        orig_left_x = get(left_door, 'XData');
        orig_right_x = get(right_door, 'XData');
    end

    if access_granted
        steps = linspace(0, 1, steps_count);
    else
        steps = 0;
        extra_gap = 0;
    end

    for i = 1:length(steps)
        f = steps(i);

        % Only move door panels sideways
        set(left_door, 'XData', orig_left_x - f*extra_gap);
        set(right_door, 'XData', orig_right_x + f*extra_gap);

        drawnow;
        pause(pause_time);
    end

    if access_granted
        pause(1);
        disp('Closing door...');
        for i = length(steps):-1:1
            f = steps(i);

            % Doors slide back inward
            set(left_door, 'XData', orig_left_x - f*extra_gap);
            set(right_door, 'XData', orig_right_x + f*extra_gap);

            drawnow;
            pause(pause_time);
        end
        pause(1);
        close(gcf);
    end
end
