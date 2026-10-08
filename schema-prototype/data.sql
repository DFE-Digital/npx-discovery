insert into academic_years (year) values (2026);

insert into lead_providers (name)
values ('Ambition Institute'),
       ('Best Practice Network'),
       ('Church of England'),
       ('LLSE'),
       ('National Institute of Teaching'),
       ('University College London (UCL) Institute of Education');

insert into delivery_partners (name)
values ('Test 1 TSH'),
       ('Test 2 TSH'),
       ('Test 3 TSH'),
       ('Test 4 TSH'),
       ('Test 5 TSH');

insert into partnerships
  (lead_provider_name,               delivery_partner_name)
values
  ('LLSE',                           'Test 1 TSH'),
  ('LLSE',                           'Test 2 TSH'),
  ('National Institute of Teaching', 'Test 2 TSH'),
  ('National Institute of Teaching', 'Test 2 TSH');

insert into institutions (name)
values ('Grange Hill'),
       ('Bayside High School'),
       ('Springfield Elementary');

insert into teachers (name)
values ('Tim Henman'),
       ('Serena Williams'),
       ('Martina Hingis'),
       ('Pete Sampras');

insert into accounts (teacher_name, email)
values
  ('Tim Henman', 'tim@hotmail.com'),
  ('Tim Henman', 'tim@gmail.com'),
  ('Serena Williams', 'sw@gmail.com'),
  ('Martina Hingis', 'martina@yahoo.com'),
  ('Pete Sampras', 'pete.sampras@gmail.com');

insert into contracts
  (name,   lead_provider_name, academic_year)
values
  ('LLSE - 2026', 'LLSE',      2026);

insert into contract_courses
  (id, contract_name,            course)
values
  (1,  'LLSE - 2026', 'npq-leading-teacher-development'),
  (2,  'LLSE - 2026', 'npq-early-years-leadership');

insert into registration_periods
  (id, start_date,  finish_date)
values
  (1, '2026-07-06', '2026-11-30'),
  (2, '2026-10-02', null);

insert into applications
  (id,  registration_period_id,  teacher_name,      institution_name)
values
  (1,   1,                       'Tim Henman',      'Grange Hill'),
  (2,   1,                       'Serena Williams', 'Bayside High School'),
  (3,   2,                       'Pete Sampras',    'Springfield Elementary');
