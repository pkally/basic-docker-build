-- Accounts that are allowed to access the dashboards.
CREATE TABLE Account (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP NOT NULL,
uuid UUID UNIQUE NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
avatar VARCHAR(255) NOT NULL,
password INTEGER UNIQUE NOT NULL,
FOREIGN KEY (password) REFERENCES Password (id)
);

-- A password to be associated with the account.
CREATE TABLE Password (
id SERIAL PRIMARY KEY,
hash BYTEA(16) NOT NULL,
salt BYTEA(16) NOT NULL
);

-- A blog post (portion of my website).
CREATE TABLE Blog_Post (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP NOT NULL,
title VARCHAR(255) UNIQUE NOT NULL,
account INTEGER NOT NULL,
FOREIGN KEY account REFERENCES Account (id)
);

-- An category to associate with a blog post.
CREATE TABLE Blog_Category (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
deleted TIMESTAMP NOT NULL,
name VARCHAR(255) UNIQUE NOT NULL
);

-- An image to associate with a blog post.
CREATE TABLE Blog_Post_Image (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP NOT NULL,
path VARCHAR(255) NOT NULL,
blog_post INTEGER NOT NULL,
FOREIGN KEY blog_post REFERENCES Blog_Post (id)
);

-- A existing project.
CREATE TABLE Project (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP NOT NULL,
title VARCHAR(255) UNIQUE NOT NULL
);

-- An category to associate with a blog post.
CREATE TABLE Project_Category (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
deleted TIMESTAMP NOT NULL,
name VARCHAR(255) UNIQUE NOT NULL
);

-- A image associated with a project.
CREATE TABLE Project_Image (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP,
path VARCHAR(255) NOT NULL,
project INTEGER NOT NULL,
FOREIGN KEY (project) REFERENCES Project (id)
);

-- A link associated with a project.
CREATE TABLE Project_Link (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP,
link VARCHAR(255),
project INTEGER NOT NULL,
FOREIGN KEY (project) REFERENCES Project (id)
);

-- Contacts stored if sent a contact request.
CREATE TABLE Contact (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
description VARCHAR(255)
);

-- A skill an a designated score that I have assigned it.
CREATE TABLE Skill (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
title VARCHAR(255) UNIQUE NOT NULL,
description VARCHAR(255),
score SMALLINT NOT NULL CHECK (score >= 0 AND score <= 100)
);

-- An image associated with a skill
CREATE TABLE Skill_Image (  
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
path VARCHAR(255) NOT NULL,
skill INTEGER UNIQUE NOT NULL,
FOREIGN KEY (skill) REFERENCES Skill (id)
);

-- A representation of experience at a certain role.
CREATE TABLE Experience (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
title VARCHAR(255) UNIQUE NOT NULL,
description VARCHAR(255) UNIQUE NOT NULL
);

-- An image associated with a certification.
CREATE TABLE Experience_Image (  
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
path VARCHAR(255) NOT NULL,
experience INTEGER UNIQUE NOT NULL,
FOREIGN KEY (experience) REFERENCES Experience (id)
);

-- A certification and its data that has been earned.
CREATE TABLE Certification (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
acquired TIMESTAMP DEFAULT NULL,
expires TIMESTAMP DEFAULT NULL, 
title VARCHAR(255) UNIQUE NOT NULL,
description VARCHAR(255)
);

-- A link associated with a certification.
CREATE TABLE Certification_Link (
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP,
link VARCHAR(255),
certification INTEGER NOT NULL,
FOREIGN KEY (certification) REFERENCES Certification (id)
);

-- An image associated with a certification.
CREATE TABLE Certification_Image (  
id SERIAL PRIMARY KEY,
added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
deleted TIMESTAMP DEFAULT NULL,
path VARCHAR(255) NOT NULL,
certification INTEGER UNIQUE NOT NULL,
FOREIGN KEY (certification) REFERENCES Certification (id)
);