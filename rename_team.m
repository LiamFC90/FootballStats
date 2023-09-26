function [] = rename_team(oldname,newname)
%%rename_team takes two string inputs, finds the old string in an array,
%%and then replaces it with the new string.
%This function only exists due to the fact that Chris changes his team name
%at least twice a season.
%%INPUT DECLARATIONS
arguments
    oldname string
    newname string
end
%%BEGIN FUNCTION
load("teams.mat","teams");  %loads team name string from disk
fprintf('\n\nAttempting to change team name "%s" to "%s"\n\n',oldname,newname);
teams = strrep(teams,oldname,newname);  %replace array value that matches oldname with newname
fprintf('New team list is\n\n')
for n = 1:numel(teams)  %prints new team list
    fprintf('%s\n',teams(n))
    if n == numel(teams)
        fprintf('\n')
    end
end
save("teams.mat","teams");  %saves new team name string to disk
end

