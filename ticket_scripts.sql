
CREATE TABLE IF NOT EXISTS tickets (ticket_id SERIAL PRIMARY KEY, title TEXT NOT NULL, status TEXT NOT NULL,priority TEXT NOT NULL,
  created_by TEXT NOT NULL,created_at DATE);
create table if not exists ticket_messages
(message_id int ,ticket_id INT,message_text TEXT NOT NULL,author TEXT NOT NULL,created_at date,
CONSTRAINT fk_ticket_message FOREIGN KEY(ticket_id)
  REFERENCES tickets(ticket_id)
  );









SELECT ticket_id, COUNT(*) FROM ticket_messages GROUP BY 1


SELECT ticket_id, status FROM tickets WHERE ticket_id=5
  
  
  INSERT INTO tickets (ticket_id, title, status, priority, created_by,created_at)
VALUES
(1001, 'Unable to login to application', 'RESOLVED', 'HIGH','Sujai', '2026-08-01'),
(1002, 'Payment failed during checkout', 'OPEN', 'CRITICAL', 'Ronin','2026-08-01'),
(1003, 'Password reset email not received', 'IN_PROGRESS', 'MEDIUM','Sangeetha', '2026-08-05'),
(1004, 'Dashboard loading slowly', 'PENDING', 'HIGH', 'Raji','2026-08-06');

UPDATE tickets
SET category = 'Authentication'
WHERE ticket_id IN (1001, 1003);

UPDATE tickets
SET category = 'Payment'
WHERE ticket_id = 1002;

UPDATE tickets
SET category = 'Performance'
WHERE ticket_id = 1004;

select * from tickets;

select * from ticket_messages --where ticket_id=4;


SELECT ticket_id as id, 
       title, 
       '' as description, 
       status, 
       priority, 
       category, 
       created_by, 
       created_at, 
       created_at as updated_at 
FROM tickets 
WHERE 1=1 
 -- AND status = 'in-progress'
ORDER BY created_at DESC

SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'ticket_messages'
ORDER BY ordinal_position;

INSERT INTO ticket_messages
(message_id, ticket_id, message_text, author, created_at)
VALUES
(1, 1001, 'Customer reports that login fails with a valid password.', 'Customer', '2026-08-01'),
(2, 1001, 'Support team requested a screenshot of the error.', 'Support', '2026-08-01'),
(3, 1002, 'Payment failed even though the customer was charged.', 'Customer', '2026-08-01'),
(4, 1002, 'Payment gateway logs are being reviewed.', 'Support', '2026-08-02'),
(5, 1003, 'Customer has not received the password reset email.', 'Customer', '2026-08-02'),
(6, 1003, 'Email delivery logs show a temporary failure.', 'Support', '2026-08-02'),
(7, 1004, 'Dashboard takes more than 30 seconds to load.', 'Customer', '2026-08-02'),
(8, 1004, 'Engineering team is investigating database performance.', 'Engineering', '2026-08-03');


ALTER TABLE tickets
ADD COLUMN category TEXT;

