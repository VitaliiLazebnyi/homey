# frozen_string_literal: true

describe ProjectsController do
  describe 'GET #index' do
    let!(:project) { create(:project) }

    it 'fills project variable' do
      get :index
      expect(assigns(:projects)).to eq([project])
    end

    it 'renders proper template' do
      get :index, params: { project_id: project.id }
      expect(response).to render_template :index
    end
  end
end
