require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスク作成' do
    before do
      @task = FactoryBot.build(:task)
    end

    context 'タスク作成が成功する' do
      it "全ての項目を正しく入力すれば作成できる" do
        expect(@task).to be_valid
      end
      it "textが空でもdateとtitleとdoneが入力されていれば作成できる" do
        @task.text = ""
        expect(@task).to be_valid
      end
    end

    context 'タスク作成が失敗する' do
      it "dateが空だと作成出来ない" do
        @task.date = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Date can't be blank")
      end
      it "titleが空だと作成出来ない" do
        @task.title = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Title can't be blank")
      end
      it "doneが空だと作成出来ない" do
        @task.done = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Done can't be blank")
      end
    end
  end
end
