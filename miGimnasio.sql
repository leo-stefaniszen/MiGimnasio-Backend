drop database if exists gimnasio;
create database gimnasio;
use gimnasio;

create table sucursales(
	id_sucursal int primary key auto_increment,
    nombre_sucursal varchar(30),
    telefono_sucursal varchar(14),
    direccion_sucursal varchar(30)
);

create table puestos(
	id_puesto int primary key auto_increment,
    nombre_puesto varchar(30),
    descripcion_puesto varchar(100)
);

create table empleados(
	id_empleado int primary key auto_increment,
    nombre_empleado varchar(30),
    apellido_empleado varchar(30),
    dni int(8),
    correo_empleado varchar(30),
    salario_empleado int,
    id_puesto int,
    id_sucursal int,
    foreign key(id_sucursal) references sucursales(id_sucursal),
    foreign key(id_puesto) references puestos(id_puesto)
);


create table turnos(
	id_turno int primary key auto_increment,
    nombre_turno varchar(15),
    fecha_turno date,
    horario_turno time
);

create table clases(
	id_clase int primary key auto_increment,
    id_sucursal int,
    id_empleado int,
    id_turno int,
    nombre_clase varchar(30),
    descripcion_clase varchar(100),
    frecuencia_semanal int(1),
    foreign key(id_sucursal) references sucursales(id_sucursal),
    foreign key(id_empleado) references empleados(id_empleado),
    foreign key(id_turno) references turnos(id_turno)
);

create table planes(
	id_plan int primary key auto_increment,
    nombre_plan varchar(20),
    duracion_plan varchar(10),
    cuotas bool,
    metodos_pago_disp varchar(30),
    precio_plan int,
    descripcion_plan varchar(50)
);


create table socios(
	id_socio int primary key auto_increment,
    id_plan int,
    dni_socio int,
    nombre_socio varchar(30),
    apellido_socio varchar(30),
    foreign key(id_plan) references planes(id_plan)
);


create table inscripciones_clases(
	id_clase int,
    id_socio int,
    fecha_inscripcion date,
    primary key(id_clase, id_socio)
);


create table ejercicios(
	id_ejercicio int primary key auto_increment,
    dia_semana varchar(10),
    musculo varchar(15),
    nombre_ejercicio varchar(20),
    series int(1),
    repeticiones int(2),
    link_video_explicativo varchar(100),
    fin_rutina date
);

create table dietas(
	id_dieta int primary key auto_increment,
    dia_semana varchar(10),
    desayuno varchar(100),
    almuerzo varchar(100),
    merienda varchar(100),
    cena varchar(100),
    fin_dieta date
);

create table objetivos(
	id_objetivo int primary key auto_increment,
    nombre_obj varchar(20),
    descripcion_obj varchar(50)
);

create table plan_personalizado(
	id_plan_pers int primary key auto_increment,
    id_socio int,
    id_ejercicio int,
    id_dieta int,
    id_objetivo int,
    fecha_creacion date,
    foreign key (id_socio) references socios(id_socio),
    foreign key (id_ejercicio) references ejercicios(id_ejercicio),
    foreign key (id_dieta) references dietas(id_dieta),
    foreign key (id_objetivo) references objetivos(id_objetivo)
);

create table pagos(
	id_pago int primary key auto_increment,
    id_socio int,
    subtotal int,
    fecha_pago date,
    metodo_pago varchar(15),
    foreign key (id_socio) references socios(id_socio)
);

create table productos(
	id_producto int primary key auto_increment,
    nombre_prod varchar(30),
    descripcion_prod varchar(100),
    precio_prod int,
    stock_prod int(5),
    marca_prod varchar(20),
    categoria_prod varchar(30)
);

create table pagos_productos(
	id_pago int,
    id_producto int,
    cantidad_prod int(3),
    primary key(id_pago, id_producto)
);


create table pagos_planes(
	id_pago int,
    id_plan int,
    monto_plan int,
    fecha_inicio_plan date,
    fecha_fin_plan date,
    primary key(id_pago, id_plan)
);

-- INSERTS ----
INSERT INTO sucursales (id_sucursal, nombre_sucursal, telefono_sucursal, direccion_sucursal)
VALUES(1, 'Sede Villa San Andres', 1189201221, 'Av. Pres. Juan Domingo 3347'),
(2, 'Sede Monserrat', 1143748528, 'Sarmiento 1662'),
(3, 'Sede San Telmo', 1142830253, 'Perú 535'),
(4, 'Sede San Martin', 1132937712, 'Dr. Ramón Carrillo 2138');

INSERT INTO puestos (id_puesto, nombre_puesto, descripcion_puesto)
VALUES(1, 'Profesor', 'Da clases como yoga, boxeo, spinning o entrenamiento funcional.'),
(2, 'Asesor comercial', 'Se encarga en la venta de membresías y servicios.'),
(3, 'Recepcionista', 'Se encarga de la atención al cliente, el registro de miembros y las tareas administrativas de la recepción.'),
(4, 'Gerente de gimnasio', 'Supervisa las operaciones diarias del establecimiento.'),
(5, 'Limpieza', 'Se encarga de la limpieza del lugar.');

INSERT INTO empleados (nombre_empleado, apellido_empleado, dni, correo_empleado, salario_empleado, id_puesto, id_sucursal)
VALUES 
-- SUCURSAL 1 -------
('Mogul', 'Ramirez', 320765, 'mogul.ramirez@gmail.com', 2500000, 1, 1), -- Profesor
('Valentina', 'Ruiz', 42145896, 'valentina.ruiz@gmail.com', 1180000, 1, 1), -- Profesor
('Martina', 'Lopez', 40123567, 'martina.lopez@hotmail.com', 2500000, 1, 1), -- Profesor
('Nicole', 'Gomez', 32005678, 'nicole.gomez@gmail.com', 2100000, 1, 1), -- Profesor
('Matias', 'Gimenez', 37210654, 'matias.gimenez@hotmail.com', 2410000, 1, 1), -- Profesor

('Lourdes', 'Fernandez', 32703065, 'lourdes.fernandez@hotmail.com', 1900000, 2, 1), -- Asesor comercial
('Santiago', 'Perez', 38976432, 'santiago.perez@hotmail.com', 1950000, 2, 1), -- Asesor comercial
('Agustin', 'Torres', 39456231, 'agustin.torres@gmail.com', 2050000, 2, 1), -- Asesor comercial

('Camila', 'Dominguez', 40321578, 'camila.dominguez@gmail.com', 1860000, 3, 1), -- Recepcionista
('Matias', 'Rodriguez', 39321018, 'matias.rodriguez@gmail.com', 1115000, 3, 1), -- Recepcionista
('Mateo', 'Espinosa', 37016302, 'mateo.spinosa@gmail.com', 1550000, 3, 1), -- Recepcionista
('Carlos', 'Fernández', '30567891', 'carlos.fernandez@gmail.com', 1370000, 3, 1), -- Recepcionista
('Sofía', 'López', '28654321', 'sofia.lopez@hotmail.com', 1190000, 3, 1), -- Recepcionista
('Miguel', 'García', '21436587', 'miguel.garcia@gmail.com', 1400000, 3, 1), -- Recepcionista

('Andrea', 'Rodriguez', 31042123, 'andrea.rodriguezfitt@gmail.com', 3800000, 4, 1), -- Gerente de gimnasio

('Leandro', 'Insua', 31042123, 'andrea.rodriguezfitt@gmail.com', 950000, 5, 1), -- Limpieza
('Martin', 'Salas', 31042123, 'martinsalas@gmail.com', 1200000, 5, 1), -- Limpieza
('Tomas', 'Cisneros', 31042123, 'tomicisnerost@gmail.com', 1500000, 5, 1), -- Limpieza
('Javier', 'Portilla', 31042123, 'javierportilla19@gmail.com', 1350000, 5, 1), -- Limpieza

-- SUCURSAL 2 ---
('Martín', 'Suarez', 33087612, 'martin.suarez@gmail.com', 2550000, 1, 2), -- Profesor
('Lucía', 'Morales', 42895412, 'lucia.morales@gmail.com', 1200000, 1, 2), -- Profesor
('Santiago', 'Ledesma', 41234568, 'santiago.ledesma@hotmail.com', 2480000, 1, 2), -- Profesor
('Julia', 'Mendoza', 32345679, 'julia.mendoza@gmail.com', 2150000, 1, 2), -- Profesor
('Agustina', 'Espósito', 38125647, 'agustina.esposito@hotmail.com', 2380000, 1, 2), -- Profesor
('Florencia', 'Romero', 28965432, 'florencia.romero@hotmail.com', 2200000, 1, 2), -- Recepcionista

('Ignacio', 'Rojas', 33502987, 'ignacio.rojas@hotmail.com', 1920000, 2, 2), -- Asesor comercial
('Florencia', 'Castro', 39784321, 'florencia.castro@hotmail.com', 1980000, 2, 2), -- Asesor comercial
('Diego', 'Reyes', 39765329, 'diego.reyes@gmail.com', 2070000, 2, 2), -- Asesor comercial

('Marina', 'Alvarez', 40813456, 'marina.alvarez@gmail.com', 1870000, 3, 2), -- Recepcionista
('Joaquín', 'Vega', 40678912, 'joaquin.vega@gmail.com', 1130000, 3, 2), -- Recepcionista
('Clara', 'Silva', 37506432, 'clara.silva@gmail.com', 1570000, 3, 2), -- Recepcionista
('Nicolás', 'Molina', 30987654, 'nicolas.molina@gmail.com', 1390000, 3, 2), -- Recepcionista

('Carolina', 'Ortega', 31245789, 'carolina.ortega@gmail.com', 3820000, 4, 2), -- Gerente de gimnasio

('Facundo', 'Salinas', 31567892, 'facundo.salinas@gmail.com', 960000, 5, 2), -- Limpieza
('Tomas', 'Herrero', 35678923, 'martinsalas@gmail.com', 1210000, 5, 2), -- Limpieza
('Jorge', 'Bonilla', 34789123, 'tomas.bonilla@gmail.com', 1510000, 5, 2), -- Limpieza
('Miguel', 'Rodrigo', 31821234, 'javier.portilla19@gmail.com', 1360000, 5, 2), -- Limpieza
('Lucas', 'Herrera', 21398765, 'lucas.herrera@gmail.com', 1420000, 5, 2), -- Limpieza

-- SUCURSAL 3 --
('Andrés', 'Gómez', 34123456, 'andres.gomez@gmail.com', 2600000, 1, 3), -- Profesor
('Camila', 'Rojas', 43987654, 'camila.rojas@gmail.com', 1950000, 1, 3), -- Profesor
('Javier', 'Silva', 42109876, 'javier.silva@hotmail.com', 2550000, 1, 3), -- Profesor
('Valentina', 'Díaz', 33210987, 'valentina.diaz@gmail.com', 2200000, 1, 3), -- Profesor
('Ricardo', 'Pérez', 39123456, 'ricardo.perez@hotmail.com', 2450000, 1, 3), -- Profesor

('Martín', 'Castro', 34567890, 'martin.castro@hotmail.com', 2000000, 2, 3), -- Asesor comercial
('Micaela', 'Flores', 40123456, 'micaela.flores@hotmail.com', 1850000, 2, 3), -- Asesor comercial
('Diego', 'Morales', 40789012, 'diego.morales@gmail.com', 2050000, 2, 3), -- Asesor comercial

('Sofía', 'Vega', 41234567, 'sofia.vega@gmail.com', 1550000, 3, 3), -- Recepcionista
('Juan', 'Alvarez', 41890123, 'juan.alvarez@gmail.com', 1150000, 3, 3), -- Recepcionista
('Lucía', 'Gómez', 38654321, 'lucia.gomez@gmail.com', 1450000, 3, 3), -- Recepcionista
('Manuel', 'Romero', 31098765, 'manuel.romero@gmail.com', 1300000, 3, 3), -- Recepcionista
('Florencia', 'Díaz', 29012345, 'florencia.diaz@hotmail.com', 1250000, 3, 3), -- Recepcionista
('Lucas', 'Herrera', 22456789, 'lucas.herrera2@gmail.com', 1480000, 3, 3), -- Recepcionista

('Gabriel', 'Ortega', 32345678, 'gabriel.ortega@gmail.com', 4000000, 4, 3), -- Gerente de gimnasio

('Mateo', 'Soto', 32567890, 'facundo.soto@gmail.com', 1000000, 5, 3), -- Limpieza
('Martín', 'Ferreira', 36789012, 'martin.herrero@gmail.com', 1250000, 5, 3), -- Limpieza
('Jorge', 'Molina', 35890123, 'jorge.molina@gmail.com', 1500000, 5, 3), -- Limpieza
('Miguel', 'Rojas', 32932345, 'miguel.rojas@gmail.com', 1100000, 5, 3), -- Limpieza

-- SUCURSAL 4 --
('Esteban', 'Peralta', 35432109, 'esteban.peralta@gmail.com', 2700000, 1, 4), -- Profesor
('Tamara', 'Gutiérrez', 44109876, 'tamara.gutierrez@gmail.com', 1850000, 1, 4),-- Profesor
('Germán', 'Acosta', 41765432, 'german.acosta@hotmail.com', 2350000, 1, 4), -- Profesor
('Victoria', 'Luna', 34987654, 'victoria.luna@gmail.com', 2050000, 1, 4), -- Profesor
('Alejandro', 'Sosa', 37012345, 'alejandro.sosa@hotmail.com', 2500000, 1, 4), -- Profesor

('Ezequiel', 'Villalba', 40567890, 'ezequiel.villalba@hotmail.com', 1900000, 2, 4), -- Asesor comercial
('Mariana', 'Fuentes', 42112233, 'mariana.fuentes@hotmail.com', 2080000, 2, 4), -- Asesor comercial
('Pablo', 'Carranza', 38765432, 'pablo.carranza@gmail.com', 1970000, 2, 4),  -- Asesor comercial

('Lorena', 'Moreno', 43210987, 'lorena.moreno@gmail.com', 1400000, 3, 4), -- Recepcionista
('Rubén', 'Paz', 40001122, 'ruben.paz@gmail.com', 1180000, 3, 4), -- Recepcionista
('Silvina', 'Torres', 36543210, 'silvina.torres@gmail.com', 1590000, 3, 4), -- Recepcionista
('Fabián', 'Pereyra', 33009988, 'fabian.pereyra@gmail.com', 1350000, 3, 4), -- Recepcionista
('Carla', 'Ríos', 27123456, 'carla.rios@hotmail.com', 1220000, 3, 4), -- Recepcionista
('Emilio', 'Miranda', 20567890, 'emilio.miranda@gmail.com', 1520000, 3, 4), -- Recepcionista

('Daniela', 'Ferrer', 30123987, 'daniela.ferrer@gmail.com', 3900000, 4, 4), -- Gerente de gimnasio

('Hugo', 'Velázquez', 39112233, 'hugo.velazquez@gmail.com', 1050000, 5, 4), -- Limpieza
('Sandra', 'Núñez', 37889900, 'sandra.nunez@gmail.com', 1320000, 5, 4), -- Limpieza
('Raúl', 'Cáceres', 31445566, 'raul.caceres@gmail.com', 1540000, 5, 4), -- Limpieza
('Ana', 'Domínguez', 36112233, 'ana.dominguez@gmail.com', 1120000, 5, 4); -- Limpieza



INSERT INTO turnos(id_turno, nombre_turno, fecha_turno, horario_turno)
VALUES(1, 'Mañana', '2025-10-14', '08:00:00'),
(2, 'Tarde', '2025-10-14', '14:00:00'),
(3, 'Noche', '2025-10-14', '20:00:00'),
(4, 'Mañana', '2025-10-15', '08:00:00'),
(5, 'Tarde', '2025-10-15', '14:00:00'),
(6, 'Noche', '2025-10-15', '20:00:00');

INSERT INTO clases (id_sucursal, id_empleado, id_turno, nombre_clase, descripcion_clase, frecuencia_semanal)
VALUES(1, 1, 1, 'CrossFit', 'Entrenamiento funcional de alta intensidad', 3),
(1, 2, 2, 'Zumba', 'Clase de baile fitness con música latina', 4),
(1, 3, 3, 'Spinning', 'Ciclismo indoor con diferentes niveles de resistencia', 5),
(1, 4, 1, 'Pilates', 'Ejercicios de control corporal y respiración', 3),
(2, 20, 2, 'Yoga', 'Sesión de relajación, estiramiento y meditación', 4),
(2, 21, 3, 'Funcional', 'Entrenamiento de fuerza y resistencia general', 5),
(2, 22, 1, 'Boxeo', 'Clase de boxeo grupal', 3),
(2, 23, 2, 'Body Pump', 'Ejercicios con barra para tonificar el cuerpo', 4),
(3, 39, 3, 'Stretching', 'Clase de estiramiento muscular y flexibilidad', 2),
(3, 40, 1, 'HIIT', 'Entrenamiento por intervalos de alta intensidad', 3),
(3, 41, 2, 'Kick Boxing', 'Ejercicios con técnicas de combate y cardio', 3),
(4, 58, 3, 'Aeróbica', 'Ejercicios rítmicos para mejorar la resistencia cardiovascular', 4),
(4, 59, 1, 'Cardio Dance', 'Bailes dinámicos para mejorar la resistencia', 5),
(4, 60, 2, 'Power Training', 'Entrenamiento con pesas y circuitos', 3),
(4, 61, 3, 'Calistenia', 'Ejercicios con el propio peso corporal', 4);

 INSERT INTO planes (nombre_plan, duracion_plan, cuotas, metodos_pago_disp, precio_plan, descripcion_plan)
VALUES('Plan Básico', '1 mes', False,'Efectivo', 50000, 'Acceso a todas las instalaciones y clases durante un mes. Sin cuotas.'),
('Plan Premium', '3 meses', False, 'Transferencia', 135000, 'Acceso a instalaciones y clases durante 3 meses. Sin cuotas'),
('Plan Anual', '12 meses', True, 'Tarjeta', 50000, 'Acceso completo al gimnasio por todo el año en cuotas y con beneficios exclusivos.'),
('Plan Tope de Gama', '6 meses', True, 'Tarjeta', 25000, 'Acceso a las instalaciones y clases durante 6 meses con cuotas');

INSERT INTO socios (id_plan, dni_socio, nombre_socio, apellido_socio)
VALUES(1, 40123567, 'Gonzalo', 'Gonzales'),
(1, 32703065, 'Lourdes', 'Fernandez'),
(1, 31042123, 'Andrea', 'Rodriguez'),
(2, 32005678, 'Nicole', 'Gomez'),
(2, 40123567, 'Martina', 'Lopez'),
(3, 38976432, 'Santiago', 'Perez'),
(3, 42145896, 'Valentina', 'Ruiz'),
(4, 37210654, 'Matias', 'Gimenez'),
(4, 40321578, 'Camila', 'Dominguez'),
(4, 39456231, 'Agustin', 'Torres');

INSERT INTO inscripciones_clases (id_clase, id_socio, fecha_inscripcion)
VALUES(1, 1, '2025-10-01'),
(2, 2, '2025-10-02'),
(3, 3, '2025-10-03'),
(4, 4, '2025-10-01'),
(5, 5, '2025-10-02'),
(6, 6, '2025-10-03'),
(7, 7, '2025-10-01'),
(8, 8, '2025-10-02'),
(9, 9, '2025-10-03'),
(10, 10, '2025-10-01'),
(1, 2, '2025-10-04'),
(3, 5, '2025-10-05'),
(6, 9, '2025-10-06'),
(2, 7, '2025-10-04'),
(4, 10, '2025-10-05');

INSERT INTO ejercicios (dia_semana, musculo, nombre_ejercicio, series, repeticiones, link_video_explicativo, fin_rutina)
VALUES('Lunes', 'Pecho', 'Press de banca', 4, 12, 'https://youtu.be/press_banca', '2025-12-31'),
('Martes', 'Piernas', 'Sentadillas', 4, 15, 'https://youtu.be/sentadillas', '2025-12-31'),
('Miércoles', 'Espalda', 'Remo con barra', 3, 12, 'https://youtu.be/remo_barra', '2025-12-31'),
('Jueves', 'Hombros', 'Press militar', 3, 10, 'https://youtu.be/press_militar', '2025-12-31'),
('Viernes', 'Bíceps', 'Curl con mancuernas', 3, 12, 'https://youtu.be/curl_mancuernas', '2025-12-31'),
('Lunes', 'Tríceps', 'Fondos en paralelas', 3, 15, 'https://youtu.be/fondos_paralelas', '2025-12-31'),
('Martes', 'Piernas', 'Prensa de pierna', 4, 12, 'https://youtu.be/prensa_pierna', '2025-12-31'),
('Miércoles', 'Espalda', 'Pull ups', 3, 10, 'https://youtu.be/pullups', '2025-12-31'),
('Jueves', 'Hombros', 'Elevaciones laterales', 3, 15, 'https://youtu.be/elev_laterales', '2025-12-31'),
('Viernes', 'Abdomen', 'Crunch abdominal', 4, 20, 'https://youtu.be/crunch_abdominal', '2025-12-31');


INSERT INTO dietas (dia_semana, desayuno, almuerzo, merienda, cena, fin_dieta)
VALUES
('Lunes', 'Avena con frutas', 'Pollo a la plancha con arroz integral', 'Yogur con nueces', 'Pescado al horno con verduras', '2025-12-31'),
('Martes', 'Huevos revueltos con tomate', 'Ensalada de atún y quinoa', 'Fruta fresca', 'Tacos de pollo y verduras', '2025-12-31'),
('Miércoles', 'Smoothie de banana y espinaca', 'Pasta integral con salsa de tomate y pollo', 'Barrita de cereal', 'Sopa de verduras y pescado', '2025-12-31'),
('Jueves', 'Pan integral con aguacate y huevo', 'Arroz con pollo y verduras', 'Fruta con yogur', 'Filete de ternera con ensalada', '2025-12-31'),
('Viernes', 'Cereal integral con leche', 'Ensalada de garbanzos y atún', 'Frutos secos', 'Pollo al curry con arroz', '2025-12-31'),
('Sábado', 'Tostadas integrales con mantequilla de maní', 'Pescado a la plancha con quinoa', 'Yogur con frutas', 'Pasta integral con verduras', '2025-12-31'),
('Domingo', 'Omelette de vegetales', 'Pollo al horno con batatas', 'Smoothie de frutas', 'Ensalada completa con huevo', '2025-12-31'),
('Lunes', '2 huevos revueltos con fruta', 'Carne al horno con arroz integral', 'Tostadas con casancrem', 'Pollo a la plancha con ensalada', '2025-12-31'),
('Martes', 'Cafe con leche con 2 tostadas integrales', 'Tarta de atun y verdura', 'Leche con cereales', 'Carne al horno con papas', '2025-12-31'),
('Miercoles', 'Yogurt con granola', 'Pescado al horno con pure de papa', 'Batido de proteina y banana', 'Pollo a la plancha con ensalada', '2025-12-31');

INSERT INTO objetivos (nombre_obj, descripcion_obj)
VALUES('Ganar masa muscular', 'Plan enfocado en ganar masa muscular. Ideal para personas delgadas'),
('Bajar grasa', 'Plan para bajar grasa y peso corporal.'),
('Recreativo', 'Plan para entrenar y comer saludable como hobby.'),
('Fuerza', 'Plan enfocado en fuerza. Bajas repeticiones y altas cargas. No recomendado en principiantes.'),
('Fuerza funcional', 'Plan para ganar fuerza funcional, movilidad y potencia. Ideal para deportistas.');

INSERT INTO plan_personalizado (id_socio, id_ejercicio, id_dieta, id_objetivo, fecha_creacion)
VALUES(1, 1, 1, 1, '2025-10-31'),
(2, 2, 2, 2, '2025-10-31'),
(3, 3, 3, 3, '2025-10-31'),
(4, 4, 4, 4, '2025-10-31'),
(5, 5, 5, 5, '2025-10-31');


INSERT INTO pagos (id_socio, subtotal, fecha_pago, metodo_pago)
VALUES(1, 5000, '2025-10-01', 'Efectivo'),
(2, 14000, '2025-10-02', 'Tarjeta'),
(3, 50000, '2025-10-03', 'Transferencia'),
(4, 25000, '2025-10-01', 'Tarjeta'),
(5, 7000, '2025-10-02', 'Efectivo'),
(6, 5000, '2025-10-03', 'Efectivo'),
(7, 14000, '2025-10-01', 'Tarjeta'),
(8, 50000, '2025-10-02', 'Transferencia'),
(9, 25000, '2025-10-03', 'Tarjeta'),
(10, 7000, '2025-10-01', 'Efectivo');

INSERT INTO productos (nombre_prod, descripcion_prod, precio_prod, stock_prod, marca_prod, categoria_prod)
VALUES('Mancuerna 5kg', 'Mancuerna de 5kg para entrenamiento de fuerza', 1500, 20, 'FitBrand', 'Equipamiento'),
('Colchoneta Yoga', 'Colchoneta antideslizante para yoga y pilates', 2000, 15, 'YogaPro', 'Accesorios'),
('Banda Elástica', 'Banda de resistencia para ejercicios funcionales', 800, 30, 'StrongFit', 'Accesorios'),
('Botella Agua 1L', 'Botella deportiva de 1 litro', 500, 50, 'HydroMax', 'Hidratación'),
('Balón Medicinal 4kg', 'Balón medicinal para entrenamiento de fuerza', 2500, 10, 'ProFit', 'Equipamiento'),
('Cuerda Saltar', 'Cuerda de velocidad para cardio', 700, 25, 'CardioFit', 'Accesorios'),
('Rueda Abdominal', 'Rueda para ejercicios de abdomen', 1200, 12, 'CoreStrong', 'Accesorios'),
('Guantes Pesas', 'Guantes para levantamiento de pesas', 900, 18, 'GripPro', 'Accesorios'),
('Stepper', 'Escalera step para cardio y tonificación', 3500, 8, 'StepFit', 'Equipamiento'),
('Proteína Whey 1kg', 'Suplemento proteico para recuperación muscular', 8000, 20, 'NutriMax', 'Suplementos');

INSERT INTO pagos_productos (id_pago, id_producto, cantidad_prod)
VALUES(1, 1, 2),
(1, 4, 1),
(2, 2, 1),
(2, 5, 1),
(3, 3, 3),
(4, 1, 1),
(4, 6, 2),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 2),
(9, 2, 1),
(10, 3, 2);

INSERT INTO pagos_planes (id_pago, id_plan, monto_plan, fecha_inicio_plan, fecha_fin_plan)
VALUES(1, 1, 5000, '2025-10-01', '2025-11-01'),
(2, 2, 14000, '2025-10-02', '2025-01-02'),
(3, 3, 50000, '2025-10-03', '2026-10-03'),
(4, 4, 25000, '2025-10-01', '2026-04-01'),
(5, 5, 7000, '2025-10-02', '2025-11-02'),
(6, 1, 5000, '2025-10-03', '2025-11-03'),
(7, 2, 14000, '2025-10-01', '2026-01-01'),
(8, 3, 50000, '2025-10-02', '2026-10-02'),
(9, 4, 25000, '2025-10-03', '2026-04-03'),
(10, 5, 7000, '2025-10-01', '2025-11-01');



/*
SELECT s.id_socio, s.nombre_socio, s.apellido_socio, p.nombre_plan, p.duracion_plan
FROM socios s
JOIN planes p ON s.id_plan = p.id_plan;

SELECT s.nombre_socio, s.apellido_socio, c.nombre_clase, c.descripcion_clase, t.nombre_turno, t.fecha_turno
FROM inscripciones_clases ic
JOIN socios s ON ic.id_socio = s.id_socio
JOIN clases c ON ic.id_clase = c.id_clase
JOIN turnos t ON c.id_turno = t.id_turno
WHERE s.id_socio = 1;  -- Cambiar 1 por el ID del socio

SELECT e.nombre_empleado, e.apellido_empleado, p.nombre_puesto, p.descripcion_puesto, s.nombre_sucursal
FROM empleados e
JOIN puestos p ON e.id_puesto = p.id_puesto
JOIN sucursales s ON e.id_sucursal = s.id_sucursal;

SELECT s.nombre_socio, s.apellido_socio, pa.subtotal, pa.fecha_pago, pa.metodo_pago
FROM pagos pa
JOIN socios s ON pa.id_socio = s.id_socio
WHERE s.id_socio = 1;  -- Cambiar 1 por el ID del socio

SELECT s.nombre_socio, s.apellido_socio, pr.nombre_prod, pp.cantidad_prod, pr.precio_prod, (pp.cantidad_prod * pr.precio_prod) AS total
FROM pagos_productos pp
JOIN pagos p ON pp.id_pago = p.id_pago
JOIN productos pr ON pp.id_producto = pr.id_producto
JOIN socios s ON p.id_socio = s.id_socio
WHERE s.id_socio = 1;

SELECT s.nombre_socio, s.apellido_socio, pl.nombre_plan, pp.monto_plan, pp.fecha_inicio_plan, pp.fecha_fin_plan
FROM pagos_planes pp
JOIN planes pl ON pp.id_plan = pl.id_plan
JOIN socios s ON pl.id_plan = s.id_plan
WHERE s.id_socio = 1;

SELECT s.nombre_socio, s.apellido_socio, e.nombre_ejercicio, e.musculo, e.series, e.repeticiones, d.desayuno, d.almuerzo, d.merienda, d.cena, pp.objetivo, pp.descripcion_plan_pers
FROM plan_personalizado pp
JOIN socios s ON pp.id_socio = s.id_socio
JOIN ejercicios e ON pp.id_ejercicio = e.id_ejercicio
JOIN dietas d ON pp.id_dieta = d.id_dieta
WHERE s.id_socio = 1;

SELECT su.nombre_sucursal, c.nombre_clase, c.descripcion_clase, e.nombre_empleado, e.apellido_empleado, t.nombre_turno
FROM clases c
JOIN sucursales su ON c.id_sucursal = su.id_sucursal
JOIN empleados e ON c.id_empleado = e.id_empleado
JOIN turnos t ON c.id_turno = t.id_turno
WHERE su.id_sucursal = 2;  -- Cambiar por el ID de la sucursal

-- Cambiar el plan de un socio
UPDATE socios SET id_plan = 2 WHERE id_socio = 1;

-- Dar de baja una clase
DELETE FROM clases WHERE id_clase = 3;

-- Total de pagos por socio
SELECT s.nombre_socio, SUM(p.subtotal) AS total_pagado
FROM pagos p
JOIN socios s ON p.id_socio = s.id_socio
GROUP BY s.id_socio;

-- Clases más populares
SELECT c.nombre_clase, COUNT(i.id_socio) AS cantidad_inscriptos
FROM inscripciones_clases i
JOIN clases c ON i.id_clase = c.id_clase
GROUP BY c.id_clase
ORDER BY cantidad_inscriptos DESC;

-- Administrador: acceso total
CREATE USER 'admin_gimnasio'@'localhost' IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON GIMNASIO.* TO 'admin_gimnasio'@'localhost';

-- Empleado: solo lectura y escritura básica
CREATE USER 'empleado_gimnasio'@'localhost' IDENTIFIED BY 'Empleado123!';
GRANT SELECT, INSERT, UPDATE ON GIMNASIO.* TO 'empleado_gimnasio'@'localhost';

-- Recepcionista: solo puede registrar pagos y ver socios
CREATE USER 'recepcion'@'localhost' IDENTIFIED BY 'Recep123!';
GRANT SELECT, INSERT ON GIMNASIO.pagos TO 'recepcion'@'localhost';
GRANT SELECT ON GIMNASIO.socios TO 'recepcion'@'localhost';
-- VErifica permisos
SHOW GRANTS FOR 'empleado_gimnasio'@'localhost';
-- Modifica permisos
REVOKE UPDATE ON GIMNASIO.* FROM 'empleado_gimnasio'@'localhost';





