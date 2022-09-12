% Gráficas del control cinemático

figure(1);
set(gcf,'color','w');
plot3(out.xr,out.yr,out.zr);grid;
xlabel('x');ylabel('y');zlabel('z');

figure(2);
set(gcf,'color','w');
subplot(3,1,1);
plot(out.qr.time,out.qr.signals.values(:,1));grid;
xlabel('time (s)');ylabel('rad');
title('q1');
subplot(3,1,2);
plot(out.qr.time,out.qr.signals.values(:,2));grid;
xlabel('time (s)');ylabel('rad');
title('q2');
subplot(3,1,3);
plot(out.qr.time,out.qr.signals.values(:,3));grid;
xlabel('time (s)');ylabel('m');
title('q3');

figure(3);
set(gcf,'color','w');
subplot(3,1,1);
plot(out.q_ci.time,out.q_ci.signals.values(:,1));grid;
xlabel('time (s)');ylabel('rad');
title('q1calculado');
subplot(3,1,2);
plot(out.q_ci.time,out.q_ci.signals.values(:,2));grid;
xlabel('time (s)');ylabel('rad');
title('q2calculado');
subplot(3,1,3);
plot(out.q_ci.time,out.q_ci.signals.values(:,3));grid;
xlabel('time (s)');ylabel('m');
title('q3calculado');

figure(4);
set(gcf,'color','w');
subplot(3,1,1);
plot(out.q_ci.time,out.q_ci.signals.values(:,1));
hold on;
plot(out.qr.time,out.qr.signals.values(:,1));grid;
hold off;
legend('q1 calculado','q1 según GTCL');
xlabel('time (s)');ylabel('rad');
title('q1 comparación');
subplot(3,1,2);
plot(out.q_ci.time,out.q_ci.signals.values(:,2));
hold on;
plot(out.qr.time,out.qr.signals.values(:,2));grid;
hold off;
legend('q2 calculado','q2 según GTCL');
xlabel('time (s)');ylabel('rad');
title('q2 comparación');
subplot(3,1,3);
plot(out.q_ci.time,out.q_ci.signals.values(:,3));
hold on;
plot(out.qr.time,out.qr.signals.values(:,3));grid;
hold off;
legend('q3 calculado','q3 según GTCL');
xlabel('time (s)');ylabel('m');
title('q3 comparación');