import React from "react";
import { AppRegistry, StyleSheet, Text, View } from "react-native";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFFFFF"
  },
  hello: {
    fontSize: 20,
    textAlign: "center",
    margin: 10
  }
});

class AReactNative extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>Hello ReactNative!</Text>
      </View>
    );
  }
}

AppRegistry.registerComponent("AReactNative", () => AReactNative);
