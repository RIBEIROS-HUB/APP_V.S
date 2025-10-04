import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style= "fontSize: 20">Victória Secret's</Text>
      <StatusBar style="none" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#DEA183',
    alignItems: 'center',
    justifyContent: 'top',
    fontSize: 25,
    color: '#ffff00',
  },
});
