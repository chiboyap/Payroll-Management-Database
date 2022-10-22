-- create the database Imo_State_Uni
CREATE DATABASE IF  NOT EXISTS 'imo_state_uni';
DROP TABLE IF EXISTS Person;
CREATE TABLE IF NOT EXISTS Person (
    ssn varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    dob varchar(32) NOT NULL,
    address varchar(32) NOT NULL,
    CONSTRAINT person_pk PRIMARY KEY (name)

);

DROP TABLE IF EXISTS Company;
CREATE TABLE IF NOT EXISTS Company (
    company_id varchar(32) ,
    company_name varchar(32),
    CONSTRAINT comp_pk PRIMARY KEY (company_name)

);

DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
    department_id varchar(32) NOT NULL,
    depName varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    CONSTRAINT departmentcomp_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE


);

DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
    employee_id varchar(32) NOT NULL,
    position varchar(32) NOT NULL,
    department varchar(32) NOT NULL,
    empname varchar(32) NOT NULL,
    companyName varchar(32) NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (empname),
    CONSTRAINT employee_person_name FOREIGN KEY (empname) REFERENCES Person(name)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT employee_comp_fk FOREIGN KEY (companyName) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Contract;
CREATE TABLE IF NOT EXISTS Contract (
    contract_id varchar(32) NOT NULL,
    companyName varchar(32) NOT NULL,
    empName varchar(32) NOT NULL,
    beginDate varchar(32) NOT NULL,
    pay varchar(32) NOT NULL,

    CONSTRAINT contractcompany_fk FOREIGN KEY (companyName) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT contractemp_fk FOREIGN KEY (empName) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS ExternalAudit;
CREATE TABLE IF NOT EXISTS ExternalAudit (
    audit_id varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    rate varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    discrepency varchar(32) NOT NULL,
    CONSTRAINT external_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE



);

DROP TABLE IF EXISTS InternalAudit;
CREATE TABLE IF NOT EXISTS InternalAudit (
    audit_id varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    discrepency varchar(32) NOT NULL,
    CONSTRAINT internal_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS IRS;
CREATE TABLE IF NOT EXISTS IRS (
    audit_id varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    discrepency varchar(32) NOT NULL,
    CONSTRAINT irs_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS PayrollTaxForm;
CREATE TABLE IF NOT EXISTS PayrollTaxForm (

    form_id varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    date varchar(32) NOT NULL,
    totalpaid varchar(32) NOT NULL,
    CONSTRAINT form_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE


);


DROP TABLE IF EXISTS TaxReturn;
CREATE TABLE IF NOT EXISTS TaxReturn (
    return_id varchar(32) NOT NULL,
    taxespaid varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    CONSTRAINT return_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Assets;
CREATE TABLE IF NOT EXISTS Assets (
    asset_id varchar(32) NOT NULL,
    assetname varchar(32) NOT NULL,
    company varchar(32) NOT NULL,
    CONSTRAINT asset_fk FOREIGN KEY (company) REFERENCES Company(company_name)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SocialSecurity;
CREATE TABLE IF NOT EXISTS SocialSecurity (

    rate varchar(32) NOT NULL,
    accumulated varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    CONSTRAINT ss_fk FOREIGN KEY (name) REFERENCES Person(name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS EmployeeBenefits;
CREATE TABLE IF NOT EXISTS EmployeeBenefits (
    name varchar(32) NOT NULL,
    monthlycost varchar(32) NOT NULL,
    CONSTRAINT benefit_fk FOREIGN KEY (name) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS DentalInsurance;
CREATE TABLE IF NOT EXISTS DentalInsurance(
    dental_id varchar(32) NOT NULL,
    practitioner varchar(32) NOT NULL,
    benificiary varchar(32) NOT NULL,
    CONSTRAINT dental_fk FOREIGN KEY (benificiary) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS MedicalInsurance;
CREATE TABLE IF NOT EXISTS MedicalInsurance (
    medical_id varchar(32) NOT NULL,
    practitioner varchar(32) NOT NULL,
    benificiary varchar(32) NOT NULL,

    CONSTRAINT medical_fk FOREIGN KEY (benificiary) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS InjuredEmployee;
CREATE TABLE IF NOT EXISTS InjuredEmployee (
    name varchar(32) NOT NULL,
    injury varchar(32) NOT NULL,
    CONSTRAINT injured_fk FOREIGN KEY(name) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS InjuryClaim;
CREATE TABLE IF NOT EXISTS InjuryClaim (
    claim_id varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    compensation varchar(32) NOT NULL,
    CONSTRAINT injuryclaim_fk FOREIGN KEY (name) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS EDD;
CREATE TABLE IF NOT EXISTS EDD (
    case_number varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    location varchar(32) NOT NULL,
    CONSTRAINT edd_fk FOREIGN KEY (name) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Hospital;
CREATE TABLE IF NOT EXISTS Hospital(
    hospital_id varchar(32) NOT NULL,
    address varchar(32) NOT NULL,
    name varchar(32) NOT NULL
);

DROP TABLE IF EXISTS Doctor;
CREATE TABLE IF NOT EXISTS Doctor (
    license varchar(32) NOT NULL,
    name varchar(32) NOT NULL
);

DROP TABLE IF EXISTS InsuranceCompany;
CREATE TABLE IF NOT EXISTS InsuranceCompany (
    company_name varchar(32) NOT NULL,
    phone varchar(32) NOT NULL

);



DROP TABLE IF EXISTS Account;
CREATE TABLE IF NOT EXISTS Account (
    account_id varchar(32) NOT NULL,
    vacation_hours varchar(32) NOT NULL,
    accpassword varchar(32) NOT NULL,
    ownername varchar(32)
);

DROP TABLE IF EXISTS Timecard;
CREATE TABLE IF NOT EXISTS Timecard (
    timecard_id varchar(32) NOT NULL,
    nametimecard varchar(32) NOT NULL,
    punchin varchar(32) NOT NULL,
    punchout varchar(32) NOT NULL,
    total_time varchar(32) NOT NULL,
    CONSTRAINT timecard_name FOREIGN KEY (nametimecard) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Bank_Branch;
CREATE TABLE IF NOT EXISTS Bank_Branch (
    branch_id varchar(32),
    bank_name varchar(32)
);

DROP TABLE IF EXISTS Bank_Account;
CREATE TABLE IF NOT EXISTS Bank_Account (
    routingnum varchar(32) NOT NULL,
    ownername varchar(32) NOT NULL,
    branchname varchar(32) NOT NULL,
    CONSTRAINT bankownername FOREIGN KEY (ownername) REFERENCES Person(name)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Paycheck;
CREATE TABLE IF NOT EXISTS Paycheck (
    paycheck_id varchar(32) NOT NULL,
    payperiod varchar(32) NOT NULL,
    netpay varchar(32) NOT NULL,
    grosspay varchar(32) NOT NULL,
    empname varchar(32) NOT NULL,
    CONSTRAINT paycheckemployee FOREIGN KEY (empname) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS StateTax;
CREATE TABLE IF NOT EXISTS StateTax (
    state varchar(32) NOT NULL,
    rate varchar(32) NOT NULL
);

DROP TABLE IF EXISTS FederalTax;
CREATE TABLE IF NOT EXISTS FederalTax (
    country varchar(32) NOT NULL,
    rate varchar(32) NOT NULL
);

DROP TABLE IF EXISTS Reports;
CREATE TABLE IF NOT EXISTS Reports(
    report_id varchar(32) NOT NULL,
    dateprinted varchar(32) NOT NULL,
    reporttype varchar(32) NOT NULL,
    expense_total varchar(32) NOT NULL,
    CONSTRAINT report_pk PRIMARY KEY (reporttype)



);

DROP TABLE IF EXISTS ExpenseReport;
CREATE TABLE IF NOT EXISTS ExpenseReport(
    expense_id varchar(32) NOT NULL,
    expensetype varchar(32) NOT NULL,
    expense_amount varchar(32) NOT NULL,
    CONSTRAINT expenset_fk FOREIGN KEY (expensetype) REFERENCES Reports(reporttype)
    ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS Dependent;
CREATE TABLE IF NOT EXISTS Dependent(
    dependenton varchar(32) NOT NULL,
    name varchar(32) NOT NULL,
    CONSTRAINT dependent_fk FOREIGN KEY (dependenton) REFERENCES Employee(empname)
    ON DELETE CASCADE ON UPDATE CASCADE

);
