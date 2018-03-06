import React from 'react';
import { AppRegistry, StyleSheet, Text, View, Image } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  hello: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
});

class AReactNative extends React.Component {
  render() {
    const pic = {
      uri:
        'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg',
    };
    return (
      <View style={styles.container}>
        <Image source={pic} style={{ width: 193, height: 110 }} />
        <Text style={styles.highScoresTitle}>Hello ReactNative!</Text>
      </View>
    );
  }
}

AppRegistry.registerComponent('AReactNative', () => AReactNative);
