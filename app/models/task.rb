class Task < ApplicationRecord
  validates :status,presence: true,length: {maximun:10}
  validates :content,presence: true,length: {maximum:255}
end
