class Task < ApplicationRecord
  validates :title,presence: true
  validates :start_day,presence: true
  validates :finish_day,presence: true
  validate :start_date_after_today
  validate :finish_date_after_today
  validate :finish_date_after_start_day

  def start_date_after_today
    return if start_day.blank?
    errors.add(:start_day, "は今日以降の日付を選択してください") if start_day < Date.today
  end
  
  def finish_date_after_today
    return if finish_day.blank?
    errors.add(:finish_day, "は今日以降の日付を選択してください") if finish_day < Date.today
  end
  
  def finish_date_after_start_day
    return if start_day.blank? || finish_day.blank?
    errors.add(:finish_day, "は開始日以降の日付を選択してください") if start_day > finish_day
  end
end
