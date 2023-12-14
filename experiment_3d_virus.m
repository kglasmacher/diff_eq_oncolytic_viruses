
a = 0.1;
b = 0.01;
g = 0.5;
d = 0.1;
N = 5;


t_start = 0; t_end = 500;     %set suitable time range
t_duration = [t_start t_end];   %create vector for time
w_initial = [100; 1; 10];       %column vector containing initial values
dwdt = @(t,w) [a.*w(1)-b.*w(1).*w(3); b.*w(1).*w(3)-d.*w(2); N*d.*w(2)-g.*w(3)];
[t, w] = ode45(dwdt, t_duration, w_initial);
% figure
% plot3(w(:,1),w(:,2), w(:,3), '.');
% grid on
% xlabel('uninfected')
% ylabel('infected')
% zlabel('viruses')
% rotate3d


% i=1;
% for n=1:length(w(:,1)) % use for loop to animate the line
%     plot3(w(:,1),w(:,2), w(:,3),'o','MarkerFaceColor','b')
%     i=i+1;
%     grid on
%     drawnow
% end

% Initialize video
myVideo = VideoWriter('virus_animation'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)
% Plot in a loop and grab frames
for i=1:length(w(:,1))
    plot3(w(i,1),w(i,2), w(i,3),'*r');
    grid on
    xlabel('uninfected')
    ylabel('infected')
    zlabel('viruses')
    hold on;
    pause(0.1);
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
end
close(myVideo)


% figure('Name','virus')
% for i=1:length(w(:,1))
%     plot3(w(i,1),w(i,2), w(i,3),'*r');
%     grid on
%     xlabel('uninfected')
%     ylabel('infected')
%     zlabel('viruses')
%     hold on;
%     pause(0.1);
% end
% 

%set figure window and start animation
% figure
% axis([-10 300 -10 300 -10 300]);
% hold on;
% ani = animatedline('Marker','.','Color','r','LineStyle','none');
% addpoints(ani,w(:,1),w(:,2),w(:,3));
% view(3)

% %infinite loop
% while 1
%     i = i + 1;
%     if rem(i,50) == 0  %change color randomly every 50 points
%         set(ani,'color',[rand, rand, rand])
%     end
%     addpoints(ani,w(:,1),w(:,2),w(:,3));
%     drawnow
% end
% 
% 
% for i=1:length(w)
%   pause(0.5);
%   plot3(w(i,1), w(i,2), w(i,3),'r');        % Plotting trajectory
%   hold on;
% end
% 
