class Post < ApplicationRecord
  validates :title, presence: true

	# 開始日を検証
	validates :start, presence: true #開始日がnillの場合はこっちの検証

	validate :start_check #開始日が今日より前の場合
	def start_check
    errors.add(:start, "は今日より前の日付を登録することはできません。") if start&. < Date.today
	end

	# 終了日を検証
	validates :end_day, presence: true #終了日がnillの場合はこっちの検証

	validate :end_check #終了日が開始日より前の場合
	def end_check
    errors.add(:end_day, "は開始日より前の日付を入力することは出来ません。") if end_day&. < start
	end

	# 終日を検証
	validate :all_day_check
	def all_day_check
		errors.add(:all_day, "にチェックを入れてください。") if start&. == end_day
	end
end

