# frozen_string_literal: true

describe UpdatesController, type: :routing do
  it {
    expect(get: '/projects/1/updates')
      .to route_to(controller: 'updates', action: 'index', project_id: '1')
  }

  it {
    expect(post: '/projects/1/updates')
      .to route_to(controller: 'updates', action: 'create', project_id: '1')
  }
end
