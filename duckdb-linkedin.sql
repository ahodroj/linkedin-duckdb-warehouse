INSTALL httpfs;
LOAD httpfs;

SET s3_region='us-east-1';
SET s3_url_style='path';
SET s3_endpoint='localhost:9000';
SET s3_access_key_id='YOUR ACCESS KEY';
SET s3_secret_access_key='YOUR SECRET KEY';
SET s3_use_ssl = false;

CREATE OR REPLACE TABLE connections AS 
    SELECT * FROM read_csv_auto("s3://source/linkedin/Connections.csv", 
                                normalize_names=True,
                                dateformat = '%-d %b %Y');

CREATE OR REPLACE TABLE invitations AS 
    SELECT * FROM read_csv_auto("s3://source/linkedin/Invitations.csv", 
                                normalize_names=True,
                                dateformat = '%-d %b %Y');

CREATE OR REPLACE TABLE messages AS 
    SELECT * FROM read_csv_auto("s3://source/linkedin/messages.csv", 
                                normalize_names=True,
                                dateformat = '%-d %b %Y');

