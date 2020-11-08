require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'プロジェクト作成' do
    before do
      @project = FactoryBot.build(:project)
    end

    context "プロジェクト作成が成功する" do
      it "project_nameが正しく入力されていれば作成できる" do
        expect(@project).to be_valid
      end
    end

    context "プロジェクト作成に失敗する" do
      it "project_nameが空だと作成出来ない" do
        @project.project_name = ""
        @project.valid?
        expect(@project.errors.full_messages).to include("Project name can't be blank")
      end
    end
  end
end
