# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @uploaded_members = []
  end

  def edit; end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to members_path, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @member.orders.where(status: true).count.zero?
      @member.destroy
      redirect_to :root, notice: 'Member was successfully destroyed.'
    else
      flash[:alert] =
        'Members with active orders can not be deleted. Mark his/hers open orders as returned and try again.'
      redirect_to root_url
    end
  end

  def import
    if params[:file].present?
      @uploaded_members = Member.import(params[:file])
      if @uploaded_members.any?
        redirect_to new_member_path, notice: 'Members were successfully imported.'
      else
        redirect_to new_member_path, alert: 'No valid members found in the file.'
      end
    else
      redirect_to new_member_path, alert: 'Please upload a file.'
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :phone)
  end

  def record_not_found
    redirect_to members_path, alert: 'Member not found.'
  end
end
