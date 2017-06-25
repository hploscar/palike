/* eslint-env node */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'palike',
    environment: environment,
    rootURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      },
      EXTEND_PROTOTYPES: {
        // Prevent Ember Data from overriding Date.parse.
        Date: false
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
      apiUrl: "http://localhost:4000"
    }
  };

  if (environment === 'development') {
    ENV.contentSecurityPolicy = {
      "default-src":  "'self'" + ' ' + ENV.APP.apiUrl,
      "script-src":   "'self' 'unsafe-inline' 'unsafe-eval' http://*:35729 fonts.googleapis.com",
      "font-src":     "'self' data: fonts.googleapis.com fonts.gstatic.com",
      "connect-src":  "'self'",
      "img-src":      "'self'",
      "style-src":    "'self' 'unsafe-inline' fonts.googleapis.com",
      "frame-src":    ""
   };

   ENV['ember-simple-auth'] = {
     routeAfterAuthentication: 'index',
     routeIfAlreadyAuthenticated: 'index',
     authorizer: 'authorizer:token',
     store: 'simple-auth-session-store:localStorage'
   };

   ENV['ember-simple-auth-token'] = {
     serverTokenEndpoint: ENV.APP.apiUrl + '/api/v1/sessions',
     APIWrapper: 'session',
     identificationField: 'email',
     passwordField: 'password',
     tokenPropertyName: 'jwt',
     authorizationPrefix: 'Bearer ',
     authorizationHeaderName: 'Authorization',
     headers: {'Accept':'application/vnd.api+json'},
     refreshAccessTokens: true,
     serverTokenRefreshEndpoint: ENV.APP.apiUrl + '/people/token-refresh/',
     tokenExpireName: 'exp',
     refreshLeeway: 0,
     timeFactor: 1
   };
     // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
