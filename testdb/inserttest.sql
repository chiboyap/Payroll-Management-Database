INSERT INTO `Person` (ssn, name, dob, address) VALUES ('619887890','Lana', '08281996', '1600 Holloway Ave'),('987896667','Sarah','12252001','9825 Honeybook Street'),('521987790', 'Efren', '05201996','4631 11th Avenue');

INSERT INTO `Company` (company_id, company_name) VALUES ("49023F","Amazon"), ("493DF", "Starbucks");

INSERT INTO `ExternalAudit` (audit_id, company, rate, name, discrepency) VALUES ('9548G','Amazon', '15/Hr', 'Joes Taxes', '7,820');

INSERT INTO `InternalAudit` (audit_id, company, discrepency) VALUES ('FF84', 'Amazon', '6,823');

INSERT INTO `TaxReturn` (return_id, taxespaid, company) VALUES('7548JF', '25,000', 'Amazon');

INSERT INTO `Assets` (asset_id, assetname, company) VALUES ('HFR39224', 'Delivery Van', 'Amazon'), ('JEK493', 'Espresso Machine', 'Starbucks');

INSERT INTO `InsuranceCompany` (company_name, phone) VALUES ('Allstate', '111-1111');

INSERT INTO `IRS` (audit_id, company, discrepency) VALUES ('H5K84', 'Amazon', '4,203');

INSERT INTO `SocialSecurity` (rate, accumulated, name) VALUES ('.45', '80,000', 'Lana');

INSERT INTO `PayrollTaxForm` (form_id, company, date, totalpaid) VALUES ('MN48N', 'Amazon', 'August 3, 2019', '800,000');

INSERT INTO `Department` (department_id, depName, company) VALUES ("FF473", "IT", "Amazon");

INSERT INTO `Employee` (employee_id, position, department, empname, companyName) VALUES ('7778', 'Engineer', 'IT', 'Lana', 'Amazon'),('7483', 'Cashier', 'Customer Service','Sarah', 'Starbucks');

INSERT INTO `EmployeeBenefits` (name, monthlycost) VALUES ('Lana', '450');

INSERT INTO `DentalInsurance` (dental_id, practitioner, benificiary) VALUES ('WSF492', 'Happy Dental', 'Lana');

INSERT INTO `MedicalInsurance` (medical_id, practitioner, benificiary) VALUES ('EV43H', 'UCSF', 'Lana');

INSERT INTO `InjuredEmployee` (name, injury) VALUES ('Lana', 'Broken foot');

INSERT INTO `InjuryClaim` (claim_id,name, compensation) VALUES ('4738', 'Lana', '4,000' );

INSERT INTO `EDD` (case_number, name, location) VALUES ('9568', 'Lana', '1000 Street Avenue');

INSERT INTO `Hospital` (hospital_id, address, name) VALUES ('JW84NM', '3200 Hospital Street', 'Kaiser');

INSERT INTO `Doctor` (license, name) VALUES ('NFEM93M', "Jim Smith");

INSERT INTO `Contract` (contract_id, companyName, empName, beginDate, pay) VALUES ('EF743', 'Amazon', 'Lana', 'July 23, 2004', '65,000');

INSERT INTO `Account` (account_id, vacation_hours, accpassword, ownername) VALUES ('11223', '50', 'dumb', 'Lana'),('7483', '16', 'badpass','Sarah');

INSERT INTO `Timecard` (timecard_id, nametimecard, punchin, punchout, total_time) VALUES ('11453', 'Lana', '5:00', '10:30', '23');

INSERT INTO `Bank_Account` (routingnum, ownername, branchname) VALUES ('8888', 'Lana', 'Chase');

INSERT INTO `Bank_Branch` (branch_id, bank_name) VALUES ('4393', 'Chase');

INSERT INTO `Paycheck` (paycheck_id, payperiod, netpay, grosspay, empname) VALUES ('48329', 'September 1, 2019', '1200', '950', 'Lana');

INSERT INTO `StateTax` (state, rate) VALUES ("California", ".08"), ("Washington", ".08");

INSERT INTO `FederalTax` (country, rate) VALUES ("USA", ".04");

INSERT INTO `Reports` (report_id, dateprinted, reporttype, expense_total) VALUES ("12313", "July 1, 2020", "Expense", "300");

INSERT INTO `ExpenseReport` (expense_id, expensetype, expense_amount) VALUES ("123", "Expense", "130");

INSERT INTO `Dependent` (dependenton, name) VALUES ("Lana", "Joey");
