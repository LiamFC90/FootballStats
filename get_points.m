function [] = get_points(~)
load("scores.mat","scores");
load("teams.mat","teams");
old_week = size(scores,2);
week = old_week + 1;
fprintf('Advancing from week %d to week %d\n\n',old_week,week);
for n = 1:numel(teams)
    inputscore = input(strcat(string(teams(n)),' scored how many points in week_',string(week),'?\n'));
    scores(n,week) = inputscore;
    fprintf('\n\n')
end    
save("scores.mat","scores")
end

