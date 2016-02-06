require 'spec_helper'

describe 'Faker::Avatar' do

  before(:each) do
    @tester = Faker::Avatar
  end

  it 'should test avatar' do
    expect(@tester.image.match(/https:\/\/robohash\.org\/(.+)\.png/)[1].nil?).to be_falsey
  end

  it 'should test avatar with param' do
    expect(@tester.image('faker').match(/https:\/\/robohash\.org\/(.+)\.png/)[1]).to be_eql('faker')
  end

  it 'should test avatar with correct size' do
    expect(@tester.image('faker', '150x320').match(/https:\/\/robohash\.org\/faker\.png\?size=(.+)&.*/)[1]).to be_eql('150x320')
  end

  it 'should test avatar with incorrect size' do
    expect { @tester.image(nil, '150x320z') }.to raise_error(ArgumentError)
  end

  it 'shouuld test avatar with supported format' do
    expect(@tester.image('faker', '300x300', 'jpg').match(/https:\/\/robohash\.org\/faker\.jpg/).nil?).to be_falsey
  end

  it 'should test avatar with incorrect format' do
     expect { @tester.image(nil, '300x300', 'wrong_format') }.to raise_error(ArgumentError)
  end

  it 'should test avatar with set' do
    expect(@tester.image('faker', '300x300', 'jpg', 'set2').match(/https:\/\/robohash\.org\/faker\.jpg.*set=set2/).nil?).to be_falsey
  end

  it 'should test avatar with bgset' do
    expect(@tester.image('faker', '300x300', 'jpg', 'set1', 'bg1').match(/https:\/\/robohash\.org\/faker\.jpg.*bgset=bg1/).nil?).to be_falsey
  end
end