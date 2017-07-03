import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    registration: function() {
      var credentials = this.getProperties('identification', 'password');
      Ember.debug(credentials.identification)
        // authenticator = 'authenticator:token';

      // this.get('session').authenticate(authenticator, credentials);
    }
  }
});
