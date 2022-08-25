
-- Таблица подписок
CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  subscriber_to_id INT NOT NULL,
  subscribed_to_id INT NOT NULL,  
  subscribe_at TIMESTAMP,  
);
