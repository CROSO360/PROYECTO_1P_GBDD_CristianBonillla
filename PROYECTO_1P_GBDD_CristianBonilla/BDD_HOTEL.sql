/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/11/2022 21:33:44                          */
/*==============================================================*/


drop index RELATIONSHIP_28_FK;

drop index RELATIONSHIP_27_FK;

drop index CALIFICACION_CLIENTE_PK;

drop table CALIFICACION_CLIENTE;

drop index CATEGORIA_HABITACION_PK;

drop table CATEGORIA_HABITACION;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index RELATIONSHIP_15_FK;

drop index HABITACION_PK;

drop table HABITACION;

drop index RELATIONSHIP_29_FK;

drop index RELATIONSHIP_26_FK;

drop index HABITACION_LIBERADA_PK;

drop table HABITACION_LIBERADA;

drop index RELATIONSHIP_25_FK;

drop index RELATIONSHIP_24_FK;

drop index HABITACION_PAQUETE_PK;

drop table HABITACION_PAQUETE;

drop index RELATIONSHIP_19_FK;

drop index RELATIONSHIP_17_FK;

drop index MANTENIMIENTO_HABITACION_PK;

drop table MANTENIMIENTO_HABITACION;

drop index METDOTO_PAGO_PK;

drop table METDOTO_PAGO;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_10_FK;

drop index PAGO_PK;

drop table PAGO;

drop index RELATIONSHIP_23_FK;

drop index PAQUETE_PK;

drop table PAQUETE;

drop index RELATIONSHIP_20_FK;

drop index RELATIONSHIP_16_FK;

drop index PAQUETE_SERVICIO_PK;

drop table PAQUETE_SERVICIO;

drop index PROMOCION_PK;

drop table PROMOCION;

drop index RELATIONSHIP_21_FK;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_13_FK;

drop index RESERVA_PK;

drop table RESERVA;

drop index RELATIONSHIP_22_FK;

drop index RESERVA_CANCELADA_PK;

drop table RESERVA_CANCELADA;

drop index SERVICIO_PK;

drop table SERVICIO;

drop index TRABAJADOR_PK;

drop table TRABAJADOR;

/*==============================================================*/
/* Table: CALIFICACION_CLIENTE                                  */
/*==============================================================*/
create table CALIFICACION_CLIENTE (
   ID_CALIFICACION_CLIENTE INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_RESERVA           INT4                 null,
   CALIFICACION_CLIENTE VARCHAR(1)           null,
   constraint PK_CALIFICACION_CLIENTE primary key (ID_CALIFICACION_CLIENTE)
);

/*==============================================================*/
/* Index: CALIFICACION_CLIENTE_PK                               */
/*==============================================================*/
create unique index CALIFICACION_CLIENTE_PK on CALIFICACION_CLIENTE (
ID_CALIFICACION_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_27_FK on CALIFICACION_CLIENTE (
ID_RESERVA
);

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_28_FK on CALIFICACION_CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CATEGORIA_HABITACION                                  */
/*==============================================================*/
create table CATEGORIA_HABITACION (
   ID_CATEGORIA_HABITACION INT4                 not null,
   NOMBRE_CATEGORIA_HABITACION VARCHAR(50)          null,
   DESCRIPCION_CATEGORIA_HABITACIO VARCHAR(255)         null,
   constraint PK_CATEGORIA_HABITACION primary key (ID_CATEGORIA_HABITACION)
);

/*==============================================================*/
/* Index: CATEGORIA_HABITACION_PK                               */
/*==============================================================*/
create unique index CATEGORIA_HABITACION_PK on CATEGORIA_HABITACION (
ID_CATEGORIA_HABITACION
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(20)          null,
   APELLIDO_CLIENTE     VARCHAR(20)          null,
   TIPO_DOCUMENTO_CLIENTE VARCHAR(20)          null,
   NUMERO_DOCUMENTO_CLIENTE VARCHAR(15)          null,
   CIUDAD_CLIENTE       VARCHAR(20)          null,
   DIRECCION_CLIENTE    VARCHAR(50)          null,
   TELEFONO_CLIENTE     VARCHAR(20)          null,
   CORREO_CLIENTE       VARCHAR(50)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        INT4                 not null,
   ID_CATEGORIA_HABITACION INT4                 not null,
   NUMERO_HABITACION    VARCHAR(4)           null,
   PISO_HABITACION      VARCHAR(3)           null,
   DESCRIPCION_HABITACION VARCHAR(512)         null,
   CARACTERISTICA_HABITACION VARCHAR(512)         null,
   PRECIO_DIARIO_HABITACION DECIMAL(7,2)         null,
   ESTADO_HABITACION    VARCHAR(15)          null,
   NUMERO_CAMAS_HABITACION VARCHAR(2)           null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Index: HABITACION_PK                                         */
/*==============================================================*/
create unique index HABITACION_PK on HABITACION (
ID_HABITACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on HABITACION (
ID_CATEGORIA_HABITACION
);

/*==============================================================*/
/* Table: HABITACION_LIBERADA                                   */
/*==============================================================*/
create table HABITACION_LIBERADA (
   ID_HABITACION_LIBERADA SERIAL               not null,
   ID_HABITACION        INT4                 not null,
   ID_RESERVA           INT4                 not null,
   FECHA_LIBERACION     DATE                 null,
   RAZON_LIBERACION     VARCHAR(200)         null,
   constraint PK_HABITACION_LIBERADA primary key (ID_HABITACION_LIBERADA)
);

/*==============================================================*/
/* Index: HABITACION_LIBERADA_PK                                */
/*==============================================================*/
create unique index HABITACION_LIBERADA_PK on HABITACION_LIBERADA (
ID_HABITACION_LIBERADA
);

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_26_FK on HABITACION_LIBERADA (
ID_HABITACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_29_FK on HABITACION_LIBERADA (
ID_RESERVA
);

/*==============================================================*/
/* Table: HABITACION_PAQUETE                                    */
/*==============================================================*/
create table HABITACION_PAQUETE (
   ID_HABITACION_PAQUETE INT4                 not null,
   ID_PAQUETE           INT4                 not null,
   ID_HABITACION        INT4                 not null,
   constraint PK_HABITACION_PAQUETE primary key (ID_HABITACION_PAQUETE)
);

/*==============================================================*/
/* Index: HABITACION_PAQUETE_PK                                 */
/*==============================================================*/
create unique index HABITACION_PAQUETE_PK on HABITACION_PAQUETE (
ID_HABITACION_PAQUETE
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_24_FK on HABITACION_PAQUETE (
ID_HABITACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_25_FK on HABITACION_PAQUETE (
ID_PAQUETE
);

/*==============================================================*/
/* Table: MANTENIMIENTO_HABITACION                              */
/*==============================================================*/
create table MANTENIMIENTO_HABITACION (
   ID_MANTENIMIENTO_HABITACION INT4                 not null,
   ID_HABITACION        INT4                 not null,
   ID_TRABAJADOR        INT4                 not null,
   FECHA_MANTENIMIENTO_HABITACION DATE                 null,
   OBSERVACION_MANTENIMIENTO_HABIT VARCHAR(255)         null,
   constraint PK_MANTENIMIENTO_HABITACION primary key (ID_MANTENIMIENTO_HABITACION)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_HABITACION_PK                           */
/*==============================================================*/
create unique index MANTENIMIENTO_HABITACION_PK on MANTENIMIENTO_HABITACION (
ID_MANTENIMIENTO_HABITACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on MANTENIMIENTO_HABITACION (
ID_TRABAJADOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on MANTENIMIENTO_HABITACION (
ID_HABITACION
);

/*==============================================================*/
/* Table: METDOTO_PAGO                                          */
/*==============================================================*/
create table METDOTO_PAGO (
   ID_METODO_PAGO       INT4                 not null,
   TIPO_METODO_PAGO     VARCHAR(50)          null,
   constraint PK_METDOTO_PAGO primary key (ID_METODO_PAGO)
);

/*==============================================================*/
/* Index: METDOTO_PAGO_PK                                       */
/*==============================================================*/
create unique index METDOTO_PAGO_PK on METDOTO_PAGO (
ID_METODO_PAGO
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_RESERVA           INT4                 not null,
   ID_METODO_PAGO       INT4                 not null,
   TIPO_COMPROBANTE_PAGO VARCHAR(20)          null,
   NUMERO_COMPROBANTE_PAGO VARCHAR(12)          null,
   SUBTOTAL_PAGO        DECIMAL(9,2)         null,
   TOTAL_PAGO           DECIMAL(9,2)         null,
   FECHA_EMISION_PAGO   DATE                 null,
   FECHA_PAGO           DATE                 null,
   ESTADO_PAGO          VARCHAR(20)          null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on PAGO (
ID_RESERVA
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on PAGO (
ID_METODO_PAGO
);

/*==============================================================*/
/* Table: PAQUETE                                               */
/*==============================================================*/
create table PAQUETE (
   ID_PAQUETE           INT4                 not null,
   ID_PROMOCION         INT4                 null,
   NOMBRE_PAQUETE       VARCHAR(100)         null,
   COSTO_PAQUETE        DECIMAL(7,2)         null,
   DESCRIPCION_PAQUETE  VARCHAR(255)         null,
   MAXIMO_PERSONAS_PAQUETE NUMERIC(2)           null,
   constraint PK_PAQUETE primary key (ID_PAQUETE)
);

/*==============================================================*/
/* Index: PAQUETE_PK                                            */
/*==============================================================*/
create unique index PAQUETE_PK on PAQUETE (
ID_PAQUETE
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_23_FK on PAQUETE (
ID_PROMOCION
);

/*==============================================================*/
/* Table: PAQUETE_SERVICIO                                      */
/*==============================================================*/
create table PAQUETE_SERVICIO (
   ID_PAQUETE_SERVICIO  INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   ID_PAQUETE           INT4                 not null,
   constraint PK_PAQUETE_SERVICIO primary key (ID_PAQUETE_SERVICIO)
);

/*==============================================================*/
/* Index: PAQUETE_SERVICIO_PK                                   */
/*==============================================================*/
create unique index PAQUETE_SERVICIO_PK on PAQUETE_SERVICIO (
ID_PAQUETE_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on PAQUETE_SERVICIO (
ID_PAQUETE
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_20_FK on PAQUETE_SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION (
   ID_PROMOCION         INT4                 not null,
   NOMBRE_PROMOCION     VARCHAR(50)          null,
   DESCUENTO_PROMOCION  DECIMAL(7,2)         null,
   DETALLE_PROMOCION    VARCHAR(255)         null,
   constraint PK_PROMOCION primary key (ID_PROMOCION)
);

/*==============================================================*/
/* Index: PROMOCION_PK                                          */
/*==============================================================*/
create unique index PROMOCION_PK on PROMOCION (
ID_PROMOCION
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           INT4                 not null,
   ID_PAQUETE           INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_TRABAJADOR        INT4                 not null,
   TIPO_RESERVA         VARCHAR(30)          null,
   NUMERO_PERSONAS_RESERVA NUMERIC(2)           null,
   FECHA_RESERVA        DATE                 null,
   FECHA_INGRESO_RESERVA DATE                 null,
   FECHA_SALIDA_RESERVA DATE                 null,
   COSTO_RESERVA        DECIMAL(7,2)         null,
   OBSERVACION_RESERVA  VARCHAR(512)         null,
   ESTADO_RESERVA       VARCHAR(20)          null,
   CALIFICACION_CLIENTE VARCHAR(20)          null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Index: RESERVA_PK                                            */
/*==============================================================*/
create unique index RESERVA_PK on RESERVA (
ID_RESERVA
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on RESERVA (
ID_PAQUETE
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on RESERVA (
ID_TRABAJADOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on RESERVA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: RESERVA_CANCELADA                                     */
/*==============================================================*/
create table RESERVA_CANCELADA (
   ID_RESERVA_CANCELADA SERIAL               not null,
   ID_RESERVA           INT4                 not null,
   RAZON_RESERVA_CANCELADA VARCHAR(255)         null,
   FECHA_CANCELACION    DATE                 null,
   constraint PK_RESERVA_CANCELADA primary key (ID_RESERVA_CANCELADA)
);

/*==============================================================*/
/* Index: RESERVA_CANCELADA_PK                                  */
/*==============================================================*/
create unique index RESERVA_CANCELADA_PK on RESERVA_CANCELADA (
ID_RESERVA_CANCELADA
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_22_FK on RESERVA_CANCELADA (
ID_RESERVA
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   NOMBRE_SERVICIO      VARCHAR(50)          null,
   COSTO_SERVICIO       DECIMAL(7,2)         null,
   DESCRIPCION_SERVICIO VARCHAR(255)         null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: TRABAJADOR                                            */
/*==============================================================*/
create table TRABAJADOR (
   ID_TRABAJADOR        INT4                 not null,
   NOMBRE_TRABAJADOR    VARCHAR(20)          null,
   APELLIDO_TRABAJADOR  VARCHAR(20)          null,
   TIPO_TRABAJADOR      VARCHAR(20)          null,
   TIPO_DOCUMENTO_TRABAJADOR VARCHAR(20)          null,
   NUMERO_DOCUMENTO_TRABAJADOR VARCHAR(15)          null,
   CIUDAD_TRABAJADOR    VARCHAR(20)          null,
   DIRECCION_TRABAJADOR VARCHAR(50)          null,
   TELEFONO_TRABAJADOR  VARCHAR(20)          null,
   CORREO_TRABAJADOR    VARCHAR(50)          null,
   constraint PK_TRABAJADOR primary key (ID_TRABAJADOR)
);

/*==============================================================*/
/* Index: TRABAJADOR_PK                                         */
/*==============================================================*/
create unique index TRABAJADOR_PK on TRABAJADOR (
ID_TRABAJADOR
);

alter table CALIFICACION_CLIENTE
   add constraint FK_CALIFICA_RELATIONS_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table CALIFICACION_CLIENTE
   add constraint FK_CALIFICA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_CATEGORI foreign key (ID_CATEGORIA_HABITACION)
      references CATEGORIA_HABITACION (ID_CATEGORIA_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION_LIBERADA
   add constraint FK_HABITACI_RELATIONS_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION_LIBERADA
   add constraint FK_HABITACI_RELATIONS_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table HABITACION_PAQUETE
   add constraint FK_HABITACI_RELATIONS_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION_PAQUETE
   add constraint FK_HABITACI_RELATIONS_PAQUETE foreign key (ID_PAQUETE)
      references PAQUETE (ID_PAQUETE)
      on delete restrict on update restrict;

alter table MANTENIMIENTO_HABITACION
   add constraint FK_MANTENIM_RELATIONS_TRABAJAD foreign key (ID_TRABAJADOR)
      references TRABAJADOR (ID_TRABAJADOR)
      on delete restrict on update restrict;

alter table MANTENIMIENTO_HABITACION
   add constraint FK_MANTENIM_RELATIONS_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_METDOTO_ foreign key (ID_METODO_PAGO)
      references METDOTO_PAGO (ID_METODO_PAGO)
      on delete restrict on update restrict;

alter table PAQUETE
   add constraint FK_PAQUETE_RELATIONS_PROMOCIO foreign key (ID_PROMOCION)
      references PROMOCION (ID_PROMOCION)
      on delete restrict on update restrict;

alter table PAQUETE_SERVICIO
   add constraint FK_PAQUETE__RELATIONS_PAQUETE foreign key (ID_PAQUETE)
      references PAQUETE (ID_PAQUETE)
      on delete restrict on update restrict;

alter table PAQUETE_SERVICIO
   add constraint FK_PAQUETE__RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_PAQUETE foreign key (ID_PAQUETE)
      references PAQUETE (ID_PAQUETE)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_TRABAJAD foreign key (ID_TRABAJADOR)
      references TRABAJADOR (ID_TRABAJADOR)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table RESERVA_CANCELADA
   add constraint FK_RESERVA__RELATIONS_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

