function [] = plot_it(~)
load("scores.mat","scores");
load("teams.mat","teams");
week = size(scores,2);
    [S,~,M] = get_stats(teams);
    xspace = 1:1:12;
    bar(xspace,M,.4,'blue')
    hold on
    ylabel('Mean points')


    S1 = M - S; 
    S2 = M + S;


    bar(xspace+.1,S2,.2,'red')
        LM = zeros(1,12) + mean(M);
    plot(xspace,LM,"LineWidth",2,"Color",'g')
    bar(xspace+.1,S1,.2,'blue')

    title(strcat('Javale4prez Week ',string(week),' Stats'))
    xticks([1 2 3 4 5 6 7 8 9 10 11 12])
    xticklabels(teams)
    grid on
   
    hold on
    
    plot(xspace,LM,"LineWidth",2,"Color",'g')
    legend('Mean', 'Std',strcat('LeagueAvg=',string(round(mean(M),2))),Location='best')
    exportgraphics(gcf,strcat(string(week),'.png'),"Resolution",150)    
end