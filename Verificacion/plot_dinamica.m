% Plot joint values for model and proof model

figure(1);
set(gcf,'color','w');
sgtitle('Evolución de las coord. articulares');
subplot(3,1,1);
plot(out.q.time,out.q.signals.values);
hold on;
plot(out.qp.time,out.qp.signals.values);
title('q');
grid;
subplot(3,1,2);
plot(out.qd.time,out.qd.signals.values);
hold on;
plot(out.qdp.time,out.qdp.signals.values);
title('qd');
grid;
subplot(3,1,3);
plot(out.qdd.time,out.qdd.signals.values);
hold on;
plot(out.qddp.time,out.qddp.signals.values);
title('qdd');
grid;