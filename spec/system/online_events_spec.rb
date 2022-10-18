# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OnlineEvents', type: :system do
  let(:user)  { create :user }
  let(:event) { create :event }

  describe 'onlineイベント関係' do
    context 'onlineイベント作成' do
      before do
        login(user)
      end

      it 'onlineイベントを作成することができる。' do
        visit new_event_path
        fill_in 'Title', with: 'RUNTEQもくもく会'
        fill_in 'Content', with: '渋谷にあるRUNTEQ教室でもくもく会'
        fill_in 'Held at', with: '002055-10-02-1300'
        select 'オンライン', from: 'Location'
        fill_in 'Online url', with: 'https://school.runteq.jp/'
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).to have_content('RUNTEQもくもく会')
        expect(page).to have_content('渋谷にあるRUNTEQ教室でもくもく会')
        expect(page).to have_content(user.name)
        expect(page).to have_content('開催前')
        expect(page).to have_content('オンライン')
        expect(page).to have_content('https://school.runteq.jp/')

        visit root_path
        expect(page).to have_content('RUNTEQもくもく会')
        expect(page).to have_content('渋谷にあるRUNTEQ教室でもくもく会')
        expect(page).to have_content(user.name)
        expect(page).to have_content('オンライン')
      end

      it 'Online urlが空白でもイベント作成できる。' do
        visit new_event_path
        fill_in 'Title', with: 'RUNTEQもくもく会'
        fill_in 'Content', with: '渋谷にあるRUNTEQ教室でもくもく会'
        fill_in 'Held at', with: '002055-10-02-1300'
        select 'オンライン', from: 'Location'
        fill_in 'Online url', with: ''
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).to have_content('RUNTEQもくもく会')
      end

      it 'Online urlに"https:"以外から始まる文字列が入力された場合イベント作成できない。' do
        visit new_event_path
        fill_in 'Title', with: 'RUNTEQもくもく会'
        fill_in 'Content', with: '渋谷にあるRUNTEQ教室でもくもく会'
        fill_in 'Held at', with: '002055-10-02-1300'
        select 'オンライン', from: 'Location'
        fill_in 'Online url', with: 'hogehoge'
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).to have_content('もくもく会作成')
      end

      it 'Online urlに"https:"から始まる文字列が入力された場合イベント作成できる。' do
        visit new_event_path
        fill_in 'Title', with: 'RUNTEQもくもく会'
        fill_in 'Content', with: '渋谷にあるRUNTEQ教室でもくもく会'
        fill_in 'Held at', with: '002055-10-02-1300'
        select 'オンライン', from: 'Location'
        fill_in 'Online url', with: 'https://school.runteq.jp/'
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).not_to have_content('もくもく会作成')
      end
    end

    context 'onlineイベント更新' do
      before do
        login(event.user)
      end

      it 'offlineイベントをonlineイベントに更新できる' do
        visit edit_event_path(event)
        fill_in 'Title', with: 'RUNTEQもくもく会'
        fill_in 'Content', with: '渋谷にあるRUNTEQ教室でもくもく会'
        fill_in 'Held at', with: '002055-10-02-1300'
        select '東京都', from: 'Prefecture'
        select 'オンライン', from: 'Location'
        fill_in 'Online url', with: 'https://school.runteq.jp/'
        click_button '登録'

        expect(page).to have_content('オンライン')
        expect(page).to have_content('https://school.runteq.jp/')

        visit root_path
        expect(page).to have_content('RUNTEQもくもく会')
        expect(page).to have_content('渋谷にあるRUNTEQ教室でもくもく会')
        expect(page).to have_content(event.user.name)
        expect(page).to have_content('オンライン')
      end

      it 'Online urlに"https:"以外から始まる文字列が入力された場合、イベントは更新されない。' do
        visit edit_event_path(event)
        fill_in 'Online url', with: 'hogehoge'
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).to have_content('もくもく会編集')
      end

      it 'Online urlに"https:"から始まる文字列が入力された場合、イベントは更新できる。' do
        visit edit_event_path(event)
        fill_in 'Online url', with: 'https://school.runteq.jp/'
        select '東京都', from: 'Prefecture'
        click_button '登録'

        expect(page).not_to have_content('もくもく会編集')
      end
    end
  end
end
