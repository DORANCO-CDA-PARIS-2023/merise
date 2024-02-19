create table AUTEURS 
(
   ID                   integer                        not null,
   NOM                  long varchar                   null,
   PRENOM               long varchar                   null,
   DATENAISS            date                           null,
   constraint PK_AUTEURS primary key (ID)
);


create table EMPRUNTE 
(
   IDLIVRE              integer                        not null,
   IDETUDIANT           integer                        not null,
   constraint PK_EMPRUNTE primary key (IDLIVRE, IDETUDIANT)
);


create table ETUDIANT 
(
   IDETUDIANT           integer                        not null,
   NOM                  long varchar                   null,
   PRENOM               long varchar                   null,
   DATENAISS            date                           null,
   constraint PK_ETUDIANT primary key (IDETUDIANT)
);


create table GENRE 
(
   IDGENRE              integer                        not null,
   LIBELLE              long varchar                   null,
   constraint PK_GENRE primary key (IDGENRE)
);


create table LIVRE 
(
   IDLIVRE              integer                        not null,
   ID                   integer                        not null,
   NOM                  long varchar                   null,
   "DATE"               date                           null,
   constraint PK_LIVRE primary key (IDLIVRE)
);


create table POSSEDE 
(
   IDGENRE              integer                        not null,
   IDLIVRE              integer                        not null,
   constraint PK_POSSEDE primary key (IDGENRE, IDLIVRE)
);

alter table EMPRUNTE
   add constraint FK_EMPRUNTE_EMPRUNTE_ETUDIANT foreign key (IDETUDIANT)
      references ETUDIANT (IDETUDIANT)
      on update restrict
      on delete restrict;

alter table EMPRUNTE
   add constraint FK_EMPRUNTE_EMPRUNTE2_LIVRE foreign key (IDLIVRE)
      references LIVRE (IDLIVRE)
      on update restrict
      on delete restrict;

alter table LIVRE
   add constraint FK_LIVRE_ECRIT_AUTEURS foreign key (ID)
      references AUTEURS (ID)
      on update restrict
      on delete restrict;

alter table POSSEDE
   add constraint FK_POSSEDE_POSSEDE_LIVRE foreign key (IDLIVRE)
      references LIVRE (IDLIVRE)
      on update restrict
      on delete restrict;

alter table POSSEDE
   add constraint FK_POSSEDE_POSSEDE2_GENRE foreign key (IDGENRE)
      references GENRE (IDGENRE)
      on update restrict
      on delete restrict;

