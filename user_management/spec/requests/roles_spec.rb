require 'swagger_helper'

RSpec.describe 'roles', type: :request do

  path '/roles' do

    get('list roles') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create role') do
      response(200, 'successful') do
        consumes 'application/json'        
        parameter name: :role, in: :body, schema: {          
          type: :object,          
          properties: {            
            role_name: { type: :string }                 
          },          
        required: %w[name model]  
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/roles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show role') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('edit role') do
      response(200, 'successful') do
        # let(:id) { '123' }
        consumes 'application/json'        
        parameter name: :role, in: :body, schema: {          
          type: :object,          
          properties: {            
            role_name: { type: :string },               
          },          
        required: %w[name model]  
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    

    delete('delete role') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
