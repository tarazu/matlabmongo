addpath('auto')

eng = clib.auto.Engine(4);
car = clib.auto.Car(eng);
disp(car.getEngine.isServiced == 0)

eng.isServiced = true;
disp(car.getEngine.isServiced == 1)