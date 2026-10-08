create table academic_years (
  year integer primary key
);

create table lead_providers (
  name text primary key
);

create table delivery_partners (
  name text primary key
);

create table partnerships (
  lead_provider_name text references lead_providers(name),
  delivery_partner_name text references delivery_partners(name)
);

create table contracts (
  name text primary key,
  lead_provider_name text references lead_providers(name),
  academic_year integer references academic_years(year) not null
  /*
   * we should probably hold the contract's boundary dates and
   * ensure related registration_periods exist within them:
   *
   * - monthly service fee
   * - number of payment periods
   * - per participant price
   * - service fee installments
   * - service fee percentage
   * - targeted delivery funding per participant
   *
   * also, recruitment target could be held at:
   *
   * - the contract level (how many teachers do we aim to recruit
   *   for the entirity of this contract?)
   * - the registration period (how many teachers do we aim to
   *   recruit in just this reg period)
   * - perhaps both?
   */
);

create type declaration_type as enum ('started', 'retained-1', 'retained-2', 'completed');
create type course as enum (
  'npq-leading-teacher-development',
  'npq-early-years-leadership',
  'tte-excellence-in-reception-teaching'
);
create type application_status as enum ('pending', 'accepted', 'started', 'rejected', 'completed', 'deferred', 'withdrawn');

create table contract_courses (
  id serial primary key,
  contract_name text references contracts(name) not null,
  course course not null
);

/* does the funding cap belong to the registration
 * period or the contract_course? It could be either;
 * hopefully not both
 */
create table registration_periods (
  id integer primary key,
  contract_course_id integer references contract_courses(id),
  start_date date not null,
  finish_date date
);

create table teachers (
  name text primary key
);

create table accounts (
  email text primary key,
  teacher_name text references teachers(name),
  scheme text default 'get-an-identity'
);

create table institutions (
  name text primary key
);

create table applications (
  id integer primary key,
  registration_period_id integer references registration_periods(id),
  teacher_name text references teachers(name),
  institution_name text references institutions(name),
  status application_status default 'pending'
)
