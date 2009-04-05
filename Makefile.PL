# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'intentioncloud';
all_from 'lib/intentioncloud.pm';

requires 'Catalyst::Runtime' => '5.71000';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::I18N';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Model::DBIC::Schema';
requires 'parent';
requires 'Config::General';
requires 'WebService::Google::Suggest';
requires 'HTML::TagCloud';
requires 'DateTime';
requires 'URI::Escape';
requires 'DBIx::Class::Schema::Loader';
catalyst;

install_script glob( 'script/*.pl' );
auto_install;
WriteAll;
