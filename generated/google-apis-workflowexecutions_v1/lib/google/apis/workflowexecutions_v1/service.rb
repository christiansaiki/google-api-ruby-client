# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module WorkflowexecutionsV1
      # Workflow Executions API
      #
      # Execute workflows created with Workflows API.
      #
      # @example
      #    require 'google/apis/workflowexecutions_v1'
      #
      #    Workflowexecutions = Google::Apis::WorkflowexecutionsV1 # Alias the module
      #    service = Workflowexecutions::WorkflowExecutionsService.new
      #
      # @see https://cloud.google.com/workflows
      class WorkflowExecutionsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://workflowexecutions.googleapis.com/', '',
                client_name: 'google-apis-workflowexecutions_v1',
                client_version: Google::Apis::WorkflowexecutionsV1::GEM_VERSION)
          @batch_path = 'batch'
        end
        
        # Triggers a new execution using the latest revision of the given workflow by a
        # Pub/Sub push notification.
        # @param [String] workflow
        #   Required. Name of the workflow for which an execution should be created.
        #   Format: projects/`project`/locations/`location`/workflows/`workflow`
        # @param [Google::Apis::WorkflowexecutionsV1::TriggerPubsubExecutionRequest] trigger_pubsub_execution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WorkflowexecutionsV1::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WorkflowexecutionsV1::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def trigger_workflow_pubsub_execution(workflow, trigger_pubsub_execution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+workflow}:triggerPubsubExecution', options)
          command.request_representation = Google::Apis::WorkflowexecutionsV1::TriggerPubsubExecutionRequest::Representation
          command.request_object = trigger_pubsub_execution_request_object
          command.response_representation = Google::Apis::WorkflowexecutionsV1::Execution::Representation
          command.response_class = Google::Apis::WorkflowexecutionsV1::Execution
          command.params['workflow'] = workflow unless workflow.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancels an execution of the given name.
        # @param [String] name
        #   Required. Name of the execution to be cancelled. Format: projects/`project`/
        #   locations/`location`/workflows/`workflow`/executions/`execution`
        # @param [Google::Apis::WorkflowexecutionsV1::CancelExecutionRequest] cancel_execution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WorkflowexecutionsV1::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WorkflowexecutionsV1::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_execution(name, cancel_execution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:cancel', options)
          command.request_representation = Google::Apis::WorkflowexecutionsV1::CancelExecutionRequest::Representation
          command.request_object = cancel_execution_request_object
          command.response_representation = Google::Apis::WorkflowexecutionsV1::Execution::Representation
          command.response_class = Google::Apis::WorkflowexecutionsV1::Execution
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new execution using the latest revision of the given workflow.
        # @param [String] parent
        #   Required. Name of the workflow for which an execution should be created.
        #   Format: projects/`project`/locations/`location`/workflows/`workflow` The
        #   latest revision of the workflow will be used.
        # @param [Google::Apis::WorkflowexecutionsV1::Execution] execution_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WorkflowexecutionsV1::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WorkflowexecutionsV1::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_workflow_execution(parent, execution_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/executions', options)
          command.request_representation = Google::Apis::WorkflowexecutionsV1::Execution::Representation
          command.request_object = execution_object
          command.response_representation = Google::Apis::WorkflowexecutionsV1::Execution::Representation
          command.response_class = Google::Apis::WorkflowexecutionsV1::Execution
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an execution of the given name.
        # @param [String] name
        #   Required. Name of the execution to be retrieved. Format: projects/`project`/
        #   locations/`location`/workflows/`workflow`/executions/`execution`
        # @param [String] view
        #   Optional. A view defining which fields should be filled in the returned
        #   execution. The API will default to the FULL view.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WorkflowexecutionsV1::Execution] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WorkflowexecutionsV1::Execution]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_workflow_execution(name, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::WorkflowexecutionsV1::Execution::Representation
          command.response_class = Google::Apis::WorkflowexecutionsV1::Execution
          command.params['name'] = name unless name.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of executions which belong to the workflow with the given name.
        # The method returns executions of all workflow revisions. Returned executions
        # are ordered by their start time (newest first).
        # @param [String] parent
        #   Required. Name of the workflow for which the executions should be listed.
        #   Format: projects/`project`/locations/`location`/workflows/`workflow`
        # @param [String] filter
        #   Optional. Filters applied to the [Executions.ListExecutions] results. The
        #   following fields are supported for filtering: executionID, state, startTime,
        #   endTime, duration, workflowRevisionID, stepName, and label.
        # @param [String] order_by
        #   Optional. The orderding applied to the [Executions.ListExecutions] results. By
        #   default the ordering is based on descending start time. The following fields
        #   are supported for order by: executionID, startTime, endTime, duration, state,
        #   and workflowRevisionID.
        # @param [Fixnum] page_size
        #   Maximum number of executions to return per call. Max supported value depends
        #   on the selected Execution view: it's 1000 for BASIC and 100 for FULL. The
        #   default value used if the field is not specified is 100, regardless of the
        #   selected view. Values greater than the max value will be coerced down to it.
        # @param [String] page_token
        #   A page token, received from a previous `ListExecutions` call. Provide this to
        #   retrieve the subsequent page. When paginating, all other parameters provided
        #   to `ListExecutions` must match the call that provided the page token.
        # @param [String] view
        #   Optional. A view defining which fields should be filled in the returned
        #   executions. The API will default to the BASIC view.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::WorkflowexecutionsV1::ListExecutionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::WorkflowexecutionsV1::ListExecutionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_workflow_executions(parent, filter: nil, order_by: nil, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/executions', options)
          command.response_representation = Google::Apis::WorkflowexecutionsV1::ListExecutionsResponse::Representation
          command.response_class = Google::Apis::WorkflowexecutionsV1::ListExecutionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
