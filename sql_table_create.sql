-- Create employees1 table
create table employees1 (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	sex VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL
);

-- Create departments table
CREATE TABLE "departments1" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_departments_dept_name" UNIQUE (
        "dept_name"
    )
);

-- Create titles1 table
CREATE TABLE "titles1" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     ),
    CONSTRAINT "uc_titles_title" UNIQUE (
        "title"
    )
);



-- Create salaries table
create table salaries1 (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
		)
);


-- Create department employee table
CREATE TABLE "dept_emp1" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);


-- Create Department manager table
create table dept_manager2 (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT NOT NULL,
	 CONSTRAINT "pk_dept_emp2" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

-- -- Add contraints to tables created

ALTER TABLE "employees1" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles1" ("title_id");

ALTER TABLE "employees1" ADD CONSTRAINT "CHK_sex_validation" CHECK ("sex" IN ("F", "M"))
;

ALTER TABLE "salaries1" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees1" ("emp_no");

ALTER TABLE "dept_emp1" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees1" ("emp_no");

ALTER TABLE "dept_emp1" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments1" ("dept_no");