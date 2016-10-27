import React from 'react';
import { requireNativeComponent } from 'react-native';

class Tweet extends React.Component {
  render() {
    return <RCTTweet {...this.props} />;
  }
}

Tweet.propTypes = {
  tweetId: React.PropTypes.string,
};

var RCTTweet = requireNativeComponent('RCTTweet', Tweet);

module.exports = Tweet;