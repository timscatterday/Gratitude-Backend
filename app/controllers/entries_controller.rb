class EntriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    # returns all entries
    def index
        var = request.query_parameters
        puts 'entries_controller.index var[:id]'
        puts var[:id]

        @entries = Entry.all
        @entries.map {|entry| hide_user_id(entry)}
        render json: @entries
    end

    # returns one entry by id
    def show
        @entry = Entry.find(params[:id])

        render json: hide_user_id(@entry)
    end

    # create a new entry
    def create
        @entry = Entry.create(:user_id => params[:user_id], :text => params[:text])

        @entry.save!

        render json: hide_user_id(@entry)
    end

    # updates entry by id
    def update
        @entry = Entry.find_by(:id => params[:id], :user_id => params[:user_id])

        @entry.update(entry_params)

        render json: hide_user_id(@entry)
    end

    # deletes entry by id
    def destroy
        @entry = Entry.find_by(:id => params[:id], :user_id => params[:user_id])
        @entry_copy = @entry.deep_dup

        if @entry.destroy!
            puts "entry_controller.destroy @entry"
            puts @entry
            render json: hide_user_id(@entry_copy)
        else
            # :status => 500
            render json: {status: 500, message: "Something went wrong"}
        end
    end

    private

    def hide_user_id(entry)
        entry[:user_id] = "";

        return entry
    end

    def entry_params
        params.require(:entry).permit(:text)
    end

end
