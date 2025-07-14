class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({required this.name, required this.lat, required this.lon});
}

const List<FamousCity> famousCities = [
  FamousCity(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  FamousCity(name: 'New Delhi', lat: 28.6139, lon: 77.2090),
  FamousCity(name: 'Paris', lat: 48.8566, lon: 2.3522), // Issue
  FamousCity(name: 'London', lat: 51.5074, lon: -0.1278),
  FamousCity(name: 'New York', lat: 40.7128, lon: -74.0060),
  FamousCity(name: 'Tehran', lat: 35.6892, lon: 51.3890),
  FamousCity(name: 'Sydney', lat: -33.8688, lon: 151.2093),
  FamousCity(name: 'Moscow', lat: 55.7558, lon: 37.6173),
  FamousCity(name: 'Toronto', lat: 43.6510, lon: -79.3470),
  FamousCity(name: 'São Paulo', lat: -23.5505, lon: -46.6333),
  FamousCity(name: 'Los Angeles', lat: 34.0522, lon: -118.2437),
  FamousCity(name: 'Beijing', lat: 39.9042, lon: 116.4074), // Issue
  FamousCity(name: 'Seoul', lat: 37.5665, lon: 126.9780),
  FamousCity(name: 'Bangkok', lat: 13.7563, lon: 100.5018),
  FamousCity(name: 'Berlin', lat: 52.5200, lon: 13.4050),
  FamousCity(name: 'Rome', lat: 41.9028, lon: 12.4964),
  FamousCity(name: 'Istanbul', lat: 41.0082, lon: 28.9784),
  FamousCity(name: 'Dubai', lat: 25.2048, lon: 55.2708),
  FamousCity(name: 'Singapore', lat: 1.3521, lon: 103.8198),
  FamousCity(name: 'Johannesburg', lat: -26.2041, lon: 28.0473),
];
