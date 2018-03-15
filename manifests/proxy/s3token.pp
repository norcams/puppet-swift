# == Class: swift::proxy::s3token
#
# Configure swift s3token.
#
# === Parameters
#
# [*auth_uri*]
#   (optional) The keystone auth uri
#   Defaults to http://127.0.0.1:35357/
#
# == Dependencies
#
# == Examples
#
# == Authors
#
#   Francois Charlier fcharlier@ploup.net
#
# == Copyright
#
# Copyright 2012 eNovance licensing@enovance.com
#
class swift::proxy::s3token(
  $auth_uri = 'http://127.0.0.1:35357/',
  $auth_version = '2.0',
  $insecure = false,
  $reseller_prefix = 'AUTH_',
  $delay_auth_decision = false
) {

  include ::swift::deps

  swift_proxy_config {
    'filter:s3token/use':                 value => 'egg:swift3#s3token';
    'filter:s3token/auth_uri':            value => $auth_uri;
    'filter:s3token/auth_version':        value => $auth_version;
    'filter:s3token/insecure':            value => $insecure;
    'filter:s3token/reseller_prefix':     value => $reseller_prefix;
    'filter:s3token/delay_auth_decision': value => $delay_auth_decision;
  }
}
