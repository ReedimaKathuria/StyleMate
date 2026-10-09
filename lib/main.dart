import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(const StyleMateApp());

const Color kPrimary      = Color(0xFFD4537E);
const Color kPrimaryDark  = Color(0xFF993556);
const Color kPrimaryLight = Color(0xFFFBEAF0);
const Color kPrimaryMid   = Color(0xFFF4C0D1);
const Color kGold         = Color(0xFFE9A23B);
const Color kTeal         = Color(0xFF0F6E56);
const Color kTealLight    = Color(0xFFE1F5EE);
const Color kBlue         = Color(0xFF0C447C);
const Color kBlueLight    = Color(0xFFE6F1FB);
const Color kAmber        = Color(0xFF633806);
const Color kAmberLight   = Color(0xFFFAEEDA);
const String kSupportEmail = 'support@stylemate.in';

class AppState {
  static String? userName, userEmail, userPhone, userCity, userAvatar;
  static List<OrderHistory> orders = [];
  static List<String> savedStylistIds = [];
  static bool isLoggedIn = false;

  static void login(String name, String email, String phone, String city) {
    userName = name; userEmail = email;
    userPhone = phone; userCity = city;
    isLoggedIn = true;
    userAvatar = name.isNotEmpty ? name[0].toUpperCase() : 'U';
    orders = [
      OrderHistory(id: '#482910', stylistName: 'Priya Sharma', service: 'Bridal Makeup', occasion: 'Shaadi', date: 'Mar 15, 2025', amount: 2400, status: 'Completed', rating: 5),
      OrderHistory(id: '#371204', stylistName: 'Meera Kapoor', service: 'Saree Draping', occasion: 'Engagement', date: 'Feb 28, 2025', amount: 1800, status: 'Completed', rating: 4),
      OrderHistory(id: '#519033', stylistName: 'Kavita Rao', service: 'Full Styling', occasion: 'Birthday', date: 'Jan 10, 2025', amount: 3200, status: 'Completed', rating: 5),
    ];
  }

  static void logout() {
    userName = null; userEmail = null; userPhone = null; userCity = null;
    isLoggedIn = false; orders = []; savedStylistIds = [];
  }

  static void toggleSave(String id) {
    if (savedStylistIds.contains(id)) savedStylistIds.remove(id);
    else savedStylistIds.add(id);
  }
}

class Stylist {
  final String id, name, city, specialty, avatarInitials, avatarColor;
  final List<String> tags;
  final double rating;
  final int reviews, pricePerHour;
  final bool available;
  const Stylist({required this.id, required this.name, required this.city, required this.specialty, required this.tags, required this.rating, required this.reviews, required this.pricePerHour, required this.available, required this.avatarInitials, required this.avatarColor});
}

class Planner {
  final String id, name, city, specialty, about, avatarInitials;
  final List<String> services;
  final double rating;
  final int reviews, priceFrom;
  final bool available;
  const Planner({required this.id, required this.name, required this.city, required this.specialty, required this.about, required this.avatarInitials, required this.services, required this.rating, required this.reviews, required this.priceFrom, required this.available});
}

class Shop {
  final String id, name, city, category, address, about, avatarInitials, avatarColor;
  final List<String> tags;
  final double rating;
  final int reviews;
  final bool partnered;
  const Shop({required this.id, required this.name, required this.city, required this.category, required this.address, required this.about, required this.tags, required this.rating, required this.reviews, required this.avatarInitials, required this.avatarColor, required this.partnered});
}

class Influencer {
  final String id, name, city, niche, handle, avatarInitials;
  final List<String> tags;
  final double rating;
  final int followers, pricePerSession;
  final bool available;
  const Influencer({required this.id, required this.name, required this.city, required this.niche, required this.handle, required this.avatarInitials, required this.tags, required this.rating, required this.followers, required this.pricePerSession, required this.available});
}

class OrderHistory {
  final String id, stylistName, service, occasion, date, status;
  final int amount, rating;
  const OrderHistory({required this.id, required this.stylistName, required this.service, required this.occasion, required this.date, required this.amount, required this.status, required this.rating});
}

class Booking {
  final String clientName, occasion, date, status;
  final double hours;
  final int amount;
  const Booking({required this.clientName, required this.occasion, required this.date, required this.hours, required this.amount, required this.status});
}

class PortfolioItem {
  final String label, emoji, description;
  final Color color;
  const PortfolioItem({required this.label, required this.emoji, required this.description, required this.color});
}

class StylistReview {
  final String clientName, text, date;
  final int rating;
  const StylistReview({required this.clientName, required this.text, required this.date, required this.rating});
}

class ChatMsg {
  final String text;
  final bool isUser;
  ChatMsg({required this.text, required this.isUser});
}

final List<Stylist> mockStylists = [
  const Stylist(id: '1', name: 'Priya Sharma', city: 'Mumbai', specialty: 'Makeup', tags: ['Bridal', 'HD Makeup', 'Airbrush'], rating: 4.9, reviews: 128, pricePerHour: 1200, available: true, avatarInitials: 'PS', avatarColor: 'pink'),
  const Stylist(id: '2', name: 'Meera Kapoor', city: 'Delhi', specialty: 'Clothing', tags: ['Saree Draping', 'Bridal', 'Punjabi'], rating: 4.8, reviews: 94, pricePerHour: 900, available: true, avatarInitials: 'MK', avatarColor: 'blue'),
  const Stylist(id: '3', name: 'Anjali Singh', city: 'Jaipur', specialty: 'Jewellery', tags: ['Polki', 'Kundan', 'Budget'], rating: 4.7, reviews: 76, pricePerHour: 600, available: true, avatarInitials: 'AS', avatarColor: 'teal'),
  const Stylist(id: '4', name: 'Rohan Verma', city: 'Gurgaon', specialty: 'Clothing', tags: ['Sherwani', 'Indo-Western', 'Men'], rating: 4.6, reviews: 52, pricePerHour: 700, available: false, avatarInitials: 'RV', avatarColor: 'amber'),
  const Stylist(id: '5', name: 'Neha Malhotra', city: 'Delhi', specialty: 'Makeup', tags: ['Party', 'Natural', 'Skincare'], rating: 4.8, reviews: 110, pricePerHour: 1000, available: true, avatarInitials: 'NM', avatarColor: 'pink'),
  const Stylist(id: '6', name: 'Kavita Rao', city: 'Bangalore', specialty: 'Clothing', tags: ['Lehenga', 'Bridal', 'South Indian'], rating: 4.9, reviews: 89, pricePerHour: 850, available: true, avatarInitials: 'KR', avatarColor: 'teal'),
];

final List<Planner> mockPlanners = [
  const Planner(id: 'p1', name: 'Ritika Events', city: 'Delhi', specialty: 'Wedding Planner', about: '10+ years planning dream weddings across North India.', avatarInitials: 'RE', services: ['Full Wedding', 'Engagement', 'Reception', 'Mehendi Night'], rating: 4.9, reviews: 210, priceFrom: 50000, available: true),
  const Planner(id: 'p2', name: 'Aarav Occasions', city: 'Mumbai', specialty: 'Event Planner', about: 'Luxury event curation for discerning families.', avatarInitials: 'AO', services: ['Destination Wedding', 'Anniversary', 'Corporate'], rating: 4.8, reviews: 145, priceFrom: 75000, available: true),
  const Planner(id: 'p3', name: 'Shreya Celebrations', city: 'Jaipur', specialty: 'Wedding Planner', about: 'Traditional Rajasthani weddings with modern touch.', avatarInitials: 'SC', services: ['Full Wedding', 'Haldi', 'Baraat', 'Reception'], rating: 4.7, reviews: 98, priceFrom: 40000, available: true),
  const Planner(id: 'p4', name: 'Dream Knot Co.', city: 'Bangalore', specialty: 'Destination Wedding', about: 'Creating unforgettable destination weddings since 2015.', avatarInitials: 'DK', services: ['Destination Wedding', 'Abroad Wedding', 'Luxury Package'], rating: 4.9, reviews: 176, priceFrom: 150000, available: false),
];

final List<Shop> mockShops = [
  const Shop(id: 's1', name: 'Saree Palace', city: 'Delhi', category: 'Clothing', address: 'Lajpat Nagar, New Delhi', about: 'Finest collection of bridal sarees & lehengas.', tags: ['Bridal', 'Lehenga', 'Saree', 'Designer'], rating: 4.8, reviews: 320, avatarInitials: 'SP', avatarColor: 'pink', partnered: true),
  const Shop(id: 's2', name: 'Jewel Kart', city: 'Mumbai', category: 'Jewellery', address: 'Zaveri Bazaar, Mumbai', about: 'Authentic gold, polki & kundan jewellery.', tags: ['Gold', 'Polki', 'Kundan', 'Bridal Set'], rating: 4.7, reviews: 255, avatarInitials: 'JK', avatarColor: 'amber', partnered: true),
  const Shop(id: 's3', name: 'Glam Studio', city: 'Bangalore', category: 'Makeup', address: 'Koramangala, Bangalore', about: 'Premium makeup products & bridal kits.', tags: ['Bridal', 'Mac', 'Luxury', 'Skincare'], rating: 4.6, reviews: 188, avatarInitials: 'GS', avatarColor: 'teal', partnered: true),
  const Shop(id: 's4', name: 'Sherwani House', city: 'Delhi', category: 'Menswear', address: 'Karol Bagh, New Delhi', about: 'Designer sherwanis & Indo-western for grooms.', tags: ['Sherwani', 'Indo-Western', 'Designer', 'Groom'], rating: 4.8, reviews: 143, avatarInitials: 'SH', avatarColor: 'blue', partnered: true),
  const Shop(id: 's5', name: 'Mehendi Mahal', city: 'Jaipur', category: 'Mehendi', address: 'Pink City Market, Jaipur', about: 'Traditional & modern mehendi designs.', tags: ['Bridal Mehendi', 'Arabic', 'Traditional', 'Full Hand'], rating: 4.9, reviews: 412, avatarInitials: 'MM', avatarColor: 'teal', partnered: false),
];

final List<Influencer> mockInfluencers = [
  const Influencer(id: 'i1', name: 'Tanya Bhatia', city: 'Delhi', niche: 'Bridal Fashion', handle: '@tanyabridalstyle', avatarInitials: 'TB', tags: ['Bridal', 'Saree', 'Trending'], rating: 4.9, followers: 125000, pricePerSession: 2000, available: true),
  const Influencer(id: 'i2', name: 'Vikram Looks', city: 'Mumbai', niche: 'Groom Styling', handle: '@vikramlooks', avatarInitials: 'VL', tags: ['Groom', 'Sherwani', 'Men Fashion'], rating: 4.7, followers: 89000, pricePerSession: 1500, available: true),
  const Influencer(id: 'i3', name: 'Riya Glam', city: 'Bangalore', niche: 'Makeup & Beauty', handle: '@riyaglam', avatarInitials: 'RG', tags: ['Makeup', 'Beauty', 'Skincare'], rating: 4.8, followers: 210000, pricePerSession: 2500, available: true),
  const Influencer(id: 'i4', name: 'Pooja Styles', city: 'Jaipur', niche: 'Traditional Wear', handle: '@poojastyles', avatarInitials: 'PS', tags: ['Lehenga', 'Traditional', 'Rajasthani'], rating: 4.6, followers: 67000, pricePerSession: 1200, available: false),
];

final List<Booking> mockBookings = [
  const Booking(clientName: 'Sunita Agarwal', occasion: 'Shaadi', date: 'Apr 14, 2025', hours: 3, amount: 3600, status: 'Upcoming'),
  const Booking(clientName: 'Rekha Kapoor', occasion: 'Engagement', date: 'Apr 10, 2025', hours: 2, amount: 2400, status: 'Completed'),
  const Booking(clientName: 'Pooja Mehta', occasion: 'Birthday', date: 'Apr 12, 2025', hours: 1.5, amount: 1800, status: 'Completed'),
  const Booking(clientName: 'Ritu Sharma', occasion: 'Mehendi', date: 'Apr 8, 2025', hours: 2, amount: 2400, status: 'Completed'),
  const Booking(clientName: 'Anita Gupta', occasion: 'Puja', date: 'Apr 6, 2025', hours: 1, amount: 1200, status: 'Cancelled'),
  const Booking(clientName: 'Sonia Jain', occasion: 'Shaadi', date: 'Apr 18, 2025', hours: 4, amount: 4800, status: 'Upcoming'),
];

final Map<String, List<PortfolioItem>> mockPortfolios = {
  '1': [PortfolioItem(label: 'Bridal HD Look', emoji: '👰', description: 'Full HD bridal makeup for Shaadi ceremony. Client loved the dewy finish.', color: kPrimaryLight), PortfolioItem(label: 'Airbrush Makeup', emoji: '✨', description: 'Flawless airbrush finish for engagement. 12-hour staying power.', color: kBlueLight), PortfolioItem(label: 'Mehendi Glow', emoji: '🌸', description: 'Natural glow mehendi-night look with subtle kohl and lip color.', color: kTealLight), PortfolioItem(label: 'Party Glam', emoji: '💃', description: 'Bold smokey eye with nude lip for birthday party.', color: kAmberLight)],
  '2': [PortfolioItem(label: 'Bridal Saree Drape', emoji: '👸', description: 'Intricate Bengali-style saree drape with perfect pleats for the big day.', color: kPrimaryLight), PortfolioItem(label: 'Lehenga Styling', emoji: '🥻', description: 'Complete lehenga look with dupatta setting for engagement ceremony.', color: kBlueLight), PortfolioItem(label: 'Punjabi Suit Look', emoji: '🌟', description: 'Stylish Punjabi patiala look for sangeet night.', color: kTealLight)],
  '3': [PortfolioItem(label: 'Polki Set', emoji: '💎', description: 'Head-to-toe polki jewellery styling for bridal photos.', color: kAmberLight), PortfolioItem(label: 'Kundan Styling', emoji: '👑', description: 'Kundan necklace + maangtikka + jhumka coordination.', color: kPrimaryLight), PortfolioItem(label: 'Budget Bridal', emoji: '🌺', description: 'Beautiful bridal look within Rs 15,000 jewellery budget.', color: kTealLight)],
  '4': [PortfolioItem(label: 'Sherwani Look', emoji: '🤵', description: 'Royal blue sherwani styling for baraat. Complete groom look.', color: kBlueLight), PortfolioItem(label: 'Indo-Western', emoji: '✨', description: 'Bandgala with palazzo for reception. Modern and elegant.', color: kAmberLight)],
  '5': [PortfolioItem(label: 'Natural Glow', emoji: '🌿', description: 'No-makeup makeup look for daytime events. Skin-first approach.', color: kTealLight), PortfolioItem(label: 'Party Makeup', emoji: '🎉', description: 'Vibrant party look with glitter eyes and bold lip.', color: kPrimaryLight), PortfolioItem(label: 'Skincare Prep', emoji: '💧', description: 'Pre-bridal skin prep session and makeup trial.', color: kBlueLight)],
  '6': [PortfolioItem(label: 'South Indian Bridal', emoji: '🌸', description: 'Traditional Kanjivaram saree drape with temple jewellery.', color: kPrimaryLight), PortfolioItem(label: 'Lehenga Expert', emoji: '👑', description: 'Heavy work lehenga styling for big fat wedding.', color: kAmberLight), PortfolioItem(label: 'Bridal Trial', emoji: '✨', description: 'Full bridal trial session — hair, makeup, styling.', color: kTealLight)],
};

final Map<String, List<bool>> mockAvailability = {
  '1': [true, true, false, true, true, true, false],
  '2': [true, false, true, true, false, true, true],
  '3': [false, true, true, false, true, true, true],
  '4': [true, true, false, false, true, false, true],
  '5': [true, true, true, true, false, true, false],
  '6': [false, true, false, true, true, true, true],
};

final Map<String, List<StylistReview>> mockStylistReviews = {
  '1': [StylistReview(clientName: 'Sunita A.', text: 'Amazing bridal makeup! Stayed fresh all day and night.', date: 'Mar 2025', rating: 5), StylistReview(clientName: 'Pooja M.', text: 'Very professional, came on time with full kit.', date: 'Feb 2025', rating: 5), StylistReview(clientName: 'Rekha K.', text: 'Good work overall. Will book again.', date: 'Jan 2025', rating: 4)],
  '2': [StylistReview(clientName: 'Anita S.', text: 'Perfect saree drape! Stayed put for 8 hours.', date: 'Mar 2025', rating: 5), StylistReview(clientName: 'Preethi R.', text: 'She draped my lehenga beautifully.', date: 'Feb 2025', rating: 4)],
  '3': [StylistReview(clientName: 'Vandana J.', text: 'Anjali has an amazing eye for jewellery!', date: 'Mar 2025', rating: 5), StylistReview(clientName: 'Simran K.', text: 'Helped me choose within budget beautifully.', date: 'Jan 2025', rating: 5)],
  '4': [StylistReview(clientName: 'Arjun M.', text: 'Made me look like a true groom!', date: 'Apr 2025', rating: 5), StylistReview(clientName: 'Rahul S.', text: 'Great Indo-Western suggestions.', date: 'Feb 2025', rating: 4)],
  '5': [StylistReview(clientName: 'Divya P.', text: 'The most natural makeup looks. Perfect!', date: 'Mar 2025', rating: 5), StylistReview(clientName: 'Kavya N.', text: 'Pre-bridal session was so helpful.', date: 'Jan 2025', rating: 5)],
  '6': [StylistReview(clientName: 'Meenakshi R.', text: 'Master at South Indian styling!', date: 'Apr 2025', rating: 5), StylistReview(clientName: 'Lakshmi V.', text: 'Made me feel like a queen.', date: 'Mar 2025', rating: 5)],
};

// Chatbot FAQ
const List<Map<String, String>> kBotFAQ = [
  {'q': 'how to book', 'a': 'Tap any stylist card → "Book Now" → fill details → pay. Your stylist confirms within 30 minutes! 💫'},
  {'q': 'cancel booking', 'a': 'You can cancel up to 24 hours before your appointment for a full refund. Go to Profile → Order History → Cancel.'},
  {'q': 'payment', 'a': 'We accept UPI, Credit/Debit Cards, and Net Banking. All payments are 100% secure and encrypted. 🔒'},
  {'q': 'refund', 'a': 'Full refund if cancelled 24 hours before. Contact us at $kSupportEmail within 24 hours if unsatisfied.'},
  {'q': 'chat stylist', 'a': 'Open any stylist profile → tap "Chat First" button to discuss your look before booking!'},
  {'q': 'privacy data', 'a': 'We are privacy-compliant and never sell your data. Your information is completely safe with us.'},
  {'q': 'join stylist partner', 'a': 'Email us at careers@stylemate.in with your portfolio. Our team reviews within 7 days!'},
  {'q': 'city location where', 'a': 'We currently serve 50+ cities including Delhi, Mumbai, Bangalore, Jaipur, Chennai, Kolkata and more!'},
];

String getBotReply(String q) {
  final lower = q.toLowerCase();
  for (final faq in kBotFAQ) {
    final keywords = faq['q']!.split(' ');
    if (keywords.any((k) => lower.contains(k))) return faq['a']!;
  }
  if (lower.contains('hello') || lower.contains('hi') || lower.contains('namaste')) {
    return 'Hello! 👋 How can I help you today? Ask me about bookings, payments, stylists, or anything about StyleMate!';
  }
  if (lower.contains('thank')) return 'You are most welcome! 😊 Is there anything else I can help you with?';
  if (lower.contains('price') || lower.contains('cost') || lower.contains('rate')) {
    return 'Stylist rates start from Rs 600/hr. You can set your budget while booking too! 💰';
  }
  return 'I understand your query! For detailed help:\n\n📧 Email: $kSupportEmail\n📞 Call: 1800-XXX-XXXX (Mon–Sat 9AM–7PM)\n\nOr rephrase your question and I will try again! 😊';
}

class TrendingLook {
  final String title, emoji;
  final List<String> tags;
  final Color bgColor, fgColor;
  const TrendingLook({required this.title, required this.emoji, required this.tags, required this.bgColor, required this.fgColor});
}

final List<TrendingLook> kTrendingLooks = [
  TrendingLook(title: 'Peach Ombre Bridal', emoji: '🧡', tags: ['Pastel', 'Subtle', 'Dewy'], bgColor: kPrimaryLight, fgColor: kPrimaryDark),
  TrendingLook(title: 'Bold Red Classic', emoji: '❤️', tags: ['Traditional', 'Statement'], bgColor: const Color(0xFFFFE5E5), fgColor: const Color(0xFF8B0000)),
  TrendingLook(title: 'Minimal Groom', emoji: '🤵', tags: ['Clean', 'Minimal', 'Elegant'], bgColor: kBlueLight, fgColor: kBlue),
  TrendingLook(title: 'Golden Glam', emoji: '✨', tags: ['Shimmer', 'Gold', 'Party'], bgColor: kAmberLight, fgColor: kAmber),
  TrendingLook(title: 'Fresh Florals', emoji: '🌸', tags: ['Spring', 'Light', 'Natural'], bgColor: kTealLight, fgColor: kTeal),
];

Widget kPill(String t, Color bg, Color fg) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
  decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
  child: Text(t, style: TextStyle(color: fg, fontSize: 10, fontWeight: FontWeight.w600)),
);

Color stylistBg(String c) {
  switch (c) {
    case 'blue': return kBlueLight;
    case 'teal': return kTealLight;
    case 'amber': return kAmberLight;
    default: return kPrimaryLight;
  }
}

Color stylistFg(String c) {
  switch (c) {
    case 'blue': return kBlue;
    case 'teal': return kTeal;
    case 'amber': return kAmber;
    default: return kPrimaryDark;
  }
}

class StyleMateApp extends StatelessWidget {
  const StyleMateApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'StyleMate',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: kPrimary, primary: kPrimary), useMaterial3: true),
    home: const SplashScreen(),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override State<SplashScreen> createState() => _SplashState();
}
class _SplashState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _fade, _scale;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _fade = CurvedAnimation(parent: _c, curve: Curves.easeIn);
    _scale = CurvedAnimation(parent: _c, curve: Curves.elasticOut);
    _c.forward();
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen())));
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E), Color(0xFFE8809A)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(scale: _scale, child: Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(22)), child: const Icon(Icons.auto_awesome, color: Colors.white, size: 48))),
        const SizedBox(height: 20),
        FadeTransition(opacity: _fade, child: Column(children: [
          RichText(text: const TextSpan(children: [TextSpan(text: 'Style', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800)), TextSpan(text: 'Mate', style: TextStyle(color: kGold, fontSize: 36, fontWeight: FontWeight.w800))])),
          const SizedBox(height: 8),
          const Text("India's Premier Wedding & Styling Platform", style: TextStyle(color: Colors.white70, fontSize: 13)),
        ])),
        const SizedBox(height: 60),
        const CircularProgressIndicator(color: Colors.white54, strokeWidth: 2),
      ])),
    ),
  );
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override State<AuthScreen> createState() => _AuthState();
}
class _AuthState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tab;
  final _le = TextEditingController(), _lp = TextEditingController();
  final _sn = TextEditingController(), _se = TextEditingController(), _sp = TextEditingController(), _sc = TextEditingController(), _ss = TextEditingController();
  bool _showL = false, _showS = false;
  @override void initState() { super.initState(); _tab = TabController(length: 2, vsync: this); }
  @override void dispose() { _tab.dispose(); super.dispose(); }

  void _login() {
    AppState.login(_sn.text.isEmpty ? 'Guest User' : _sn.text, _le.text.isEmpty ? 'user@stylemate.in' : _le.text, _sp.text.isEmpty ? '9876543210' : _sp.text, _sc.text.isEmpty ? 'Delhi' : _sc.text);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNav()));
  }
  void _signup() {
    if (_sn.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your name'), backgroundColor: kPrimary)); return; }
    AppState.login(_sn.text, _se.text, _sp.text, _sc.text);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNav()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(child: Column(children: [
      Container(height: 220, width: double.infinity,
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          Container(width: 64, height: 64, decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.auto_awesome, color: Colors.white, size: 32)),
          const SizedBox(height: 12),
          RichText(text: const TextSpan(children: [TextSpan(text: 'Style', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)), TextSpan(text: 'Mate', style: TextStyle(color: kGold, fontSize: 28, fontWeight: FontWeight.w800))])),
          const Text("Your perfect wedding, our expertise", style: TextStyle(color: Colors.white70, fontSize: 12)),
        ]))),
      Container(margin: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
        child: TabBar(controller: _tab, indicator: BoxDecoration(color: kPrimary, borderRadius: BorderRadius.circular(10)), indicatorSize: TabBarIndicatorSize.tab, labelColor: Colors.white, unselectedLabelColor: Colors.grey, dividerColor: Colors.transparent, tabs: const [Tab(text: 'Login'), Tab(text: 'Sign Up')])),
      SizedBox(height: 440, child: TabBarView(controller: _tab, children: [
        Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 20), child: Column(children: [
          _af('Email', _le, Icons.email_outlined), const SizedBox(height: 12),
          _af('Password', _lp, Icons.lock_outline, obs: !_showL, suf: IconButton(icon: Icon(_showL ? Icons.visibility_off : Icons.visibility, size: 18, color: Colors.grey), onPressed: () => setState(() => _showL = !_showL))),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: kPrimary, fontSize: 12)))),
          const SizedBox(height: 8), _bb('Login to StyleMate', _login), const SizedBox(height: 16),
          const Row(children: [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('or', style: TextStyle(color: Colors.grey, fontSize: 12))), Expanded(child: Divider())]),
          const SizedBox(height: 16), _sb('Continue with Google', Icons.g_mobiledata, const Color(0xFFEA4335), _login), const SizedBox(height: 8), _sb('Continue with Phone', Icons.phone, kPrimary, _login),
        ])),
        Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 20), child: Column(children: [
          _af('Full Name', _sn, Icons.person_outline), const SizedBox(height: 10),
          _af('Email', _se, Icons.email_outlined), const SizedBox(height: 10),
          _af('Phone Number', _sp, Icons.phone_outlined, kb: TextInputType.phone), const SizedBox(height: 10),
          _af('Your City', _sc, Icons.location_on_outlined), const SizedBox(height: 10),
          _af('Password', _ss, Icons.lock_outline, obs: !_showS, suf: IconButton(icon: Icon(_showS ? Icons.visibility_off : Icons.visibility, size: 18, color: Colors.grey), onPressed: () => setState(() => _showS = !_showS))),
          const SizedBox(height: 16), _bb('Create Account', _signup),
        ])),
      ])),
    ])),
  );

  Widget _af(String h, TextEditingController c, IconData i, {bool obs = false, Widget? suf, TextInputType kb = TextInputType.text}) => TextField(controller: c, keyboardType: kb, obscureText: obs, decoration: InputDecoration(hintText: h, hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), prefixIcon: Icon(i, color: Colors.grey, size: 18), suffixIcon: suf, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)));
  Widget _bb(String l, VoidCallback f) => SizedBox(width: double.infinity, child: ElevatedButton(onPressed: f, style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(l, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600))));
  Widget _sb(String l, IconData i, Color c, VoidCallback f) => SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: f, icon: Icon(i, color: c, size: 20), label: Text(l, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12), side: BorderSide(color: Colors.grey.shade300), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))));
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override State<MainNav> createState() => _MainNavState();
}
class _MainNavState extends State<MainNav> {
  int _i = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: _i, children: const [HomeScreen(), ExplorePage(), ShopsPage(), ProfileScreen()]),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpCenterScreen())),
      backgroundColor: kPrimary, mini: true, tooltip: 'Help & Support',
      child: const Icon(Icons.support_agent, color: Colors.white, size: 20),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    bottomNavigationBar: NavigationBar(
      selectedIndex: _i, onDestinationSelected: (i) => setState(() => _i = i),
      backgroundColor: Colors.white, indicatorColor: kPrimaryLight,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: kPrimary), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore, color: kPrimary), label: 'Explore'),
        NavigationDestination(icon: Icon(Icons.store_outlined), selectedIcon: Icon(Icons.store, color: kPrimary), label: 'Shops'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: kPrimary), label: 'Profile'),
      ],
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeState();
}
class _HomeState extends State<HomeScreen> {
  String _f = 'All';
  final filters = ['All', 'Clothing', 'Makeup', 'Jewellery', 'Bridal'];
  List<Stylist> get fil {
    if (_f == 'All') return mockStylists;
    if (_f == 'Bridal') return mockStylists.where((s) => s.tags.contains('Bridal')).toList();
    return mockStylists.where((s) => s.specialty == _f).toList();
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: Colors.white,
    body: CustomScrollView(slivers: [
      SliverAppBar(floating: true, snap: true, backgroundColor: Colors.white, elevation: 1,
        title: Row(children: [
          Container(width: 32, height: 32, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16)),
          const SizedBox(width: 8),
          RichText(text: const TextSpan(children: [TextSpan(text: 'Style', style: TextStyle(color: Color(0xFF1a1a1a), fontSize: 20, fontWeight: FontWeight.w700)), TextSpan(text: 'Mate', style: TextStyle(color: kPrimary, fontSize: 20, fontWeight: FontWeight.w700))])),
        ]),
        actions: [
          IconButton(icon: const Icon(Icons.support_agent_outlined), color: kPrimary, onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const HelpCenterScreen()))),
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          Padding(padding: const EdgeInsets.only(right: 8), child: CircleAvatar(radius: 16, backgroundColor: kPrimary, child: Text(AppState.userAvatar ?? 'U', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)))),
        ],
      ),
      SliverToBoxAdapter(child: _hero()),
      SliverToBoxAdapter(child: _stats()),
      SliverToBoxAdapter(child: _quick()),
      SliverToBoxAdapter(child: _trending(c)),
      SliverToBoxAdapter(child: _fbar()),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Featured Stylists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), Text('${fil.length} available', style: const TextStyle(color: Colors.grey, fontSize: 12))]))),
      const SliverToBoxAdapter(child: SizedBox(height: 12)),
      SliverList(delegate: SliverChildBuilderDelegate(
        (ctx, i) => StylistCard(stylist: fil[i], onBook: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => BookingScreen(stylist: fil[i]))), onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => StylistDetailScreen(stylist: fil[i])))),
        childCount: fil.length,
      )),
      const SliverToBoxAdapter(child: SizedBox(height: 100)),
    ]),
  );

  Widget _hero() => Container(
    decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E), Color(0xFFE8809A)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Welcome back,\n${AppState.userName ?? 'Guest'} 👋', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800, height: 1.3)),
      const SizedBox(height: 6),
      const Text('Your dream wedding is one tap away.', style: TextStyle(color: Colors.white70, fontSize: 13)),
      const SizedBox(height: 16),
      GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen())),
        child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)), child: const Row(children: [Icon(Icons.search, color: Colors.white70, size: 18), SizedBox(width: 8), Text('Search stylists, planners, shops...', style: TextStyle(color: Colors.white70, fontSize: 13))])),
      ),
    ]),
  );

  Widget _stats() => Container(color: const Color(0xFF2a0a14), padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_st('500+', 'Stylists'), _st('200+', 'Planners'), _st('4.9★', 'Rating'), _st('50+', 'Cities')]));
  Widget _st(String n, String l) => Column(children: [Text(n, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)), Text(l, style: const TextStyle(color: Colors.white54, fontSize: 10))]);

  Widget _quick() {
    final a = [
      {'icon': Icons.celebration_outlined, 'label': 'Planners', 'color': kPrimaryLight, 'fg': kPrimaryDark, 'page': const PlannersPage()},
      {'icon': Icons.brush_outlined, 'label': 'Stylists', 'color': kBlueLight, 'fg': kBlue, 'page': const StylistsPage()},
      {'icon': Icons.people_outline, 'label': 'Influencers', 'color': kAmberLight, 'fg': kAmber, 'page': const InfluencersPage()},
      {'icon': Icons.store_outlined, 'label': 'Shops', 'color': kTealLight, 'fg': kTeal, 'page': const ShopsPage()},
    ];
    return Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('What do you need?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: a.map((x) => GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => x['page'] as Widget)),
        child: Container(width: 76, padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: x['color'] as Color, borderRadius: BorderRadius.circular(12)), child: Column(children: [Icon(x['icon'] as IconData, color: x['fg'] as Color, size: 26), const SizedBox(height: 6), Text(x['label'] as String, style: TextStyle(color: x['fg'] as Color, fontSize: 11, fontWeight: FontWeight.w600))])),
      )).toList()),
    ]));
  }

  Widget _trending(BuildContext c) => Padding(padding: const EdgeInsets.fromLTRB(0, 16, 0, 8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('Trending Looks 🔥', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      TextButton(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const TrendingLooksScreen())), child: const Text('See All', style: TextStyle(color: kPrimary, fontSize: 12))),
    ])),
    const SizedBox(height: 10),
    SizedBox(height: 130, child: ListView.builder(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: kTrendingLooks.length, itemBuilder: (ctx, i) {
      final l = kTrendingLooks[i];
      return GestureDetector(onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const TrendingLooksScreen())), child: Container(width: 130, margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.fromLTRB(10, 10, 10, 8), decoration: BoxDecoration(color: l.bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: l.fgColor.withOpacity(0.15))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l.emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 6),
        Text(l.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: l.fgColor), maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Wrap(spacing: 4, children: l.tags.take(2).map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1), decoration: BoxDecoration(color: l.fgColor.withOpacity(0.12), borderRadius: BorderRadius.circular(6)), child: Text(t, style: TextStyle(fontSize: 9, color: l.fgColor)))).toList()),
      ])));
    })),
  ]));

  Widget _fbar() => Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 12), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: filters.map((f) {
    final s = f == _f;
    return Padding(padding: const EdgeInsets.only(right: 8), child: GestureDetector(onTap: () => setState(() => _f = f), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: s ? kPrimary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: s ? kPrimary : Colors.grey.shade300)), child: Text(f, style: TextStyle(color: s ? Colors.white : Colors.grey.shade600, fontSize: 13, fontWeight: s ? FontWeight.w600 : FontWeight.normal)))));
  }).toList())));
}

class TrendingLooksScreen extends StatelessWidget {
  const TrendingLooksScreen({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Trending Looks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(14)), child: const Row(children: [Icon(Icons.auto_awesome, color: Colors.white, size: 20), SizedBox(width: 10), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Curated by StyleMate', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)), Text('Fresh picks every week', style: TextStyle(color: Colors.white70, fontSize: 11))])])),
      const SizedBox(height: 20),
      ...kTrendingLooks.map((l) => Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
        Container(width: 70, height: 70, decoration: BoxDecoration(color: l.bgColor, borderRadius: BorderRadius.circular(12)), child: Center(child: Text(l.emoji, style: const TextStyle(fontSize: 36)))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(l.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, runSpacing: 4, children: l.tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: l.fgColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Text(t, style: TextStyle(fontSize: 10, color: l.fgColor, fontWeight: FontWeight.w600)))).toList()),
          const SizedBox(height: 8),
          TextButton.icon(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const StylistsPage())), icon: const Icon(Icons.brush_outlined, size: 14, color: kPrimary), label: const Text('Find Stylist', style: TextStyle(color: kPrimary, fontSize: 12)), style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap)),
        ])),
      ])))),
      const Text('Style by Occasion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      ...[
        {'occ': 'Shaadi', 'tip': 'Heavy bridal look — polki, kundan, HD makeup, silk saree or lehenga', 'emoji': '💍', 'color': kPrimaryLight, 'fg': kPrimaryDark},
        {'occ': 'Engagement', 'tip': 'Soft glam — pastel lehenga, minimal jewellery, dewy skin finish', 'emoji': '💍', 'color': kBlueLight, 'fg': kBlue},
        {'occ': 'Mehendi', 'tip': 'Bright & fun — mirror work outfit, kohl eyes, floral accessories', 'emoji': '🌿', 'color': kTealLight, 'fg': kTeal},
        {'occ': 'Reception', 'tip': 'Glamorous — sequin saree or gown, smokey eye, statement earrings', 'emoji': '✨', 'color': kAmberLight, 'fg': kAmber},
        {'occ': 'Birthday', 'tip': 'Trendy & personal — co-ord set, glitter makeup, bold lip', 'emoji': '🎂', 'color': kPrimaryLight, 'fg': kPrimaryDark},
      ].map((o) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: o['color'] as Color, borderRadius: BorderRadius.circular(12)), child: Row(children: [Text(o['emoji'] as String, style: const TextStyle(fontSize: 24)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(o['occ'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: o['fg'] as Color)), const SizedBox(height: 2), Text(o['tip'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey, height: 1.4))]))]))),
      const SizedBox(height: 20),
    ]),
  );
}

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Help & Support', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(16)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(Icons.support_agent, color: Colors.white, size: 28), SizedBox(width: 10), Text('How can we help?', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800))]), SizedBox(height: 6), Text('We are here 24/7 for you!', style: TextStyle(color: Colors.white70, fontSize: 13))])),
      const SizedBox(height: 20),
      const Text('Get Support', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
      _opt(c, Icons.chat_bubble_outlined, 'Chat with StyleMate Bot', 'Get instant answers to your questions', kPrimaryLight, kPrimaryDark, () => Navigator.push(c, MaterialPageRoute(builder: (_) => const ChatbotScreen()))),
      _opt(c, Icons.email_outlined, 'Email Support', 'Write to us at $kSupportEmail', kBlueLight, kBlue, () => ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Opening email...'), backgroundColor: kBlue))),
      _opt(c, Icons.phone_outlined, 'Call Us', 'Mon–Sat, 9AM–7PM: 1800-XXX-XXXX', kTealLight, kTeal, () => ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Calling support...'), backgroundColor: kTeal))),
      _opt(c, Icons.article_outlined, 'FAQs', 'Browse commonly asked questions', kAmberLight, kAmber, () => Navigator.push(c, MaterialPageRoute(builder: (_) => const FaqScreen()))),
      const SizedBox(height: 20),
      const Text('Quick Help', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: ['How to book?', 'Cancel booking', 'Payment issue', 'Find stylist', 'Refund policy', 'Track order'].map((t) => GestureDetector(onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => ChatbotScreen(initialQuery: t))), child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: kPrimaryMid)), child: Text(t, style: const TextStyle(fontSize: 12, color: kPrimaryDark, fontWeight: FontWeight.w500))))).toList()),
      const SizedBox(height: 20),
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Contact Information', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const SizedBox(height: 14),
        _cRow(Icons.email_outlined, 'Email Support', kSupportEmail, kBlue),
        const Divider(height: 16),
        _cRow(Icons.email_outlined, 'Careers / Join as Stylist', 'careers@stylemate.in', kTeal),
        const Divider(height: 16),
        _cRow(Icons.business_outlined, 'Business Enquiries', 'business@stylemate.in', kAmber),
        const Divider(height: 16),
        _cRow(Icons.access_time_outlined, 'Support Hours', 'Mon–Sat: 9AM – 7PM IST', kPrimaryDark),
      ])),
      const SizedBox(height: 20),
    ]),
  );

  Widget _opt(BuildContext c, IconData icon, String title, String sub, Color bg, Color fg, VoidCallback onTap) => GestureDetector(onTap: onTap, child: Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [Container(width: 44, height: 44, decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: fg, size: 22)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11))])), Icon(Icons.chevron_right, color: Colors.grey.shade400)])));
  Widget _cRow(IconData icon, String label, String value, Color color) => Row(children: [Icon(icon, size: 16, color: color), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)), Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color))]))]);
}

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});
  static const List<Map<String, String>> _faqs = [
    {'q': 'How do I book a stylist?', 'a': 'Tap any stylist card then Book Now, fill your details, select occasion and pay. Your stylist confirms within 30 minutes.'},
    {'q': 'Can I cancel my booking?', 'a': 'Yes! You can cancel up to 24 hours before your appointment for a full refund. Go to Profile then Order History then Cancel.'},
    {'q': 'What payment methods are accepted?', 'a': 'We accept UPI, Credit/Debit Cards, and Net Banking. All payments are 100% secure.'},
    {'q': 'What if I am not satisfied?', 'a': 'We offer a satisfaction guarantee. Contact us at $kSupportEmail within 24 hours and we will make it right.'},
    {'q': 'How do I chat with a stylist before booking?', 'a': 'Open any stylist profile and tap the "Chat First" button to discuss your look before confirming.'},
    {'q': 'Is my personal data safe?', 'a': 'Absolutely! We are privacy-compliant and never sell your data. Your information is completely safe.'},
    {'q': 'How do I become a stylist on StyleMate?', 'a': 'Email us at careers@stylemate.in with your portfolio. Our team reviews applications within 7 days.'},
    {'q': 'Which cities does StyleMate serve?', 'a': 'We currently serve 50+ cities including Delhi, Mumbai, Bangalore, Jaipur, Chennai, Kolkata, and more!'},
  ];
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('FAQs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(12), margin: const EdgeInsets.only(bottom: 16), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(12)), child: const Row(children: [Icon(Icons.lightbulb_outline, color: kPrimaryDark, size: 18), SizedBox(width: 8), Expanded(child: Text('Can\'t find your answer? Chat with our bot!', style: TextStyle(color: kPrimaryDark, fontSize: 12)))])),
      ..._faqs.map((item) => _FaqTile(q: item['q']!, a: item['a']!)),
      const SizedBox(height: 20),
    ]),
  );
}
class _FaqTile extends StatefulWidget {
  final String q, a;
  const _FaqTile({required this.q, required this.a});
  @override State<_FaqTile> createState() => _FaqTileState();
}
class _FaqTileState extends State<_FaqTile> {
  bool _open = false;
  @override
  Widget build(BuildContext c) => Container(margin: const EdgeInsets.only(bottom: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: _open ? kPrimaryMid : Colors.grey.shade200)), child: Column(children: [
    ListTile(title: Text(widget.q, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _open ? kPrimaryDark : Colors.black)), trailing: Icon(_open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: _open ? kPrimary : Colors.grey), onTap: () => setState(() => _open = !_open), dense: true),
    if (_open) Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 14), child: Text(widget.a, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.5))),
  ]));
}

class ChatbotScreen extends StatefulWidget {
  final String? initialQuery;
  const ChatbotScreen({super.key, this.initialQuery});
  @override State<ChatbotScreen> createState() => _ChatbotState();
}
class _ChatbotState extends State<ChatbotScreen> {
  final List<ChatMsg> _msgs = [];
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();
  bool _typing = false;

  @override
  void initState() {
    super.initState();
    _msgs.add(ChatMsg(text: "Namaste! 🙏 I am StyleMate Bot.\n\nI can help you with:\n• How to book a stylist\n• Payment & refund queries\n• Cancellation policy\n• App features & support\n\nType your question below!", isUser: false));
    if (widget.initialQuery != null) {
      Future.delayed(const Duration(milliseconds: 500), () => _send(widget.initialQuery!));
    }
  }

  void _send(String text) {
    if (text.trim().isEmpty) return;
    setState(() { _msgs.add(ChatMsg(text: text, isUser: true)); _typing = true; });
    _ctrl.clear();
    Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() { _typing = false; _msgs.add(ChatMsg(text: getBotReply(text), isUser: false)); });
      Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    });
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)),
      title: Row(children: [
        Container(width: 36, height: 36, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.support_agent, color: Colors.white, size: 20)),
        const SizedBox(width: 10),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('StyleMate Bot', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), Text('Always online', style: TextStyle(fontSize: 11, color: Colors.grey))]),
      ]),
      actions: [Container(margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: kTealLight, borderRadius: BorderRadius.circular(8)), child: const Row(children: [Icon(Icons.circle, color: kTeal, size: 8), SizedBox(width: 4), Text('Online', style: TextStyle(color: kTeal, fontSize: 11, fontWeight: FontWeight.w600))]))],
    ),
    body: Column(children: [
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: ['How to book?', 'Cancel booking', 'Payment help', 'Refund policy', 'Contact support'].map((t) => GestureDetector(onTap: () => _send(t), child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: kPrimaryMid)), child: Text(t, style: const TextStyle(fontSize: 11, color: kPrimaryDark, fontWeight: FontWeight.w500))))).toList()))),
      Expanded(child: ListView.builder(controller: _scroll, padding: const EdgeInsets.all(12), itemCount: _msgs.length + (_typing ? 1 : 0), itemBuilder: (ctx, i) {
        if (i == _msgs.length) return Padding(padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4), child: Row(children: [Container(width: 32, height: 32, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.support_agent, color: Colors.white, size: 16)), const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: const TypingDots())]));
        final msg = _msgs[i];
        return Align(alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: const EdgeInsets.only(bottom: 10), constraints: BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 0.75), child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
          if (!msg.isUser) ...[Container(width: 32, height: 32, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.support_agent, color: Colors.white, size: 16)), const SizedBox(width: 6)],
          Flexible(child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: msg.isUser ? kPrimary : Colors.white, borderRadius: BorderRadius.only(topLeft: const Radius.circular(16), topRight: const Radius.circular(16), bottomLeft: Radius.circular(msg.isUser ? 16 : 4), bottomRight: Radius.circular(msg.isUser ? 4 : 16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))]), child: Text(msg.text, style: TextStyle(fontSize: 13, color: msg.isUser ? Colors.white : Colors.black87, height: 1.4)))),
          if (msg.isUser) const SizedBox(width: 4),
        ])));
      })),
      Container(color: Colors.white, padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: MediaQuery.of(c).viewInsets.bottom + 12), child: Row(children: [
        Expanded(child: TextField(controller: _ctrl, onSubmitted: _send, textInputAction: TextInputAction.send, decoration: InputDecoration(hintText: 'Type your question...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), filled: true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
        const SizedBox(width: 8),
        GestureDetector(onTap: () => _send(_ctrl.text), child: Container(width: 44, height: 44, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.send_rounded, color: Colors.white, size: 20))),
      ])),
    ]),
  );
  @override void dispose() { _ctrl.dispose(); _scroll.dispose(); super.dispose(); }
}

class TypingDots extends StatefulWidget {
  const TypingDots({super.key});
  @override State<TypingDots> createState() => _TypingDotsState();
}
class _TypingDotsState extends State<TypingDots> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  @override void initState() { super.initState(); _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(); }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext c) => AnimatedBuilder(animation: _c, builder: (c, _) => Row(mainAxisSize: MainAxisSize.min, children: List.generate(3, (i) => Container(width: 7, height: 7, margin: const EdgeInsets.symmetric(horizontal: 2), decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimary.withOpacity(((_c.value + i * 0.33) % 1.0) < 0.5 ? 1.0 : 0.3))))));
}

class PreBookChatScreen extends StatefulWidget {
  final Stylist stylist;
  const PreBookChatScreen({super.key, required this.stylist});
  @override State<PreBookChatScreen> createState() => _PreBookChatState();
}
class _PreBookChatState extends State<PreBookChatScreen> {
  final List<ChatMsg> _msgs = [];
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();
  bool _typing = false;

  final List<List<String>> _replies = [
    ['Hi! So glad you reached out. Tell me about your occasion and the look you have in mind!', 'Hello! Feel free to share your vision. What is the look you want for your event?'],
    ['That sounds gorgeous! For that occasion I would suggest a soft glam with dewy skin. What is your skin tone?', 'Wonderful idea! I have done many similar looks. Would you prefer bold or subtle?'],
    ['I work with MAC, NARS, and Lakme Pro. Everything is hygienic and sealed. No worries at all!', 'Great question! I can also suggest accessories to match. Do you have your outfit color in mind?'],
    ['I am available on that date! My rate for a full look is Rs {price}/hr including a trial session too.', 'Yes I can accommodate that. Shall I check your preferred time slot?'],
    ['Please go ahead and Book Now using the button above! I will confirm within 30 minutes.', 'Looking forward to working with you! Book through the app and I will make your day special!'],
  ];

  @override
  void initState() {
    super.initState();
    _msgs.add(ChatMsg(text: 'Hi! I am ${widget.stylist.name} 👋\n\nWelcome! Tell me about your upcoming event — what look are you dreaming of?\n\nI specialise in: ${widget.stylist.tags.join(', ')}', isUser: false));
  }

  String _reply(int count) {
    final idx = (count ~/ 2).clamp(0, _replies.length - 1);
    final list = _replies[idx];
    return list[Random().nextInt(list.length)].replaceAll('{price}', widget.stylist.pricePerHour.toString());
  }

  void _send(String text) {
    if (text.trim().isEmpty) return;
    final count = _msgs.length;
    setState(() { _msgs.add(ChatMsg(text: text, isUser: true)); _typing = true; });
    _ctrl.clear();
    Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() { _typing = false; _msgs.add(ChatMsg(text: _reply(count), isUser: false)); });
      Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    });
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF5F5F5),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)),
      title: Row(children: [
        CircleAvatar(radius: 18, backgroundColor: stylistBg(widget.stylist.avatarColor), child: Text(widget.stylist.avatarInitials, style: TextStyle(color: stylistFg(widget.stylist.avatarColor), fontWeight: FontWeight.w600, fontSize: 12))),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.stylist.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const Text('Pre-Booking Chat', style: TextStyle(fontSize: 11, color: Colors.grey))]),
      ]),
      actions: [TextButton.icon(onPressed: () => Navigator.pushReplacement(c, MaterialPageRoute(builder: (_) => BookingScreen(stylist: widget.stylist))), icon: const Icon(Icons.calendar_today_outlined, size: 14, color: kPrimary), label: const Text('Book Now', style: TextStyle(color: kPrimary, fontSize: 12, fontWeight: FontWeight.w600)), style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10)))],
    ),
    body: Column(children: [
      Container(color: kAmberLight, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: const Row(children: [Icon(Icons.info_outline, color: kAmber, size: 16), SizedBox(width: 8), Expanded(child: Text('Simulated pre-booking chat. Book to confirm your slot!', style: TextStyle(fontSize: 11, color: kAmber)))])),
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: ['I want bridal look', 'Suggest for Shaadi', 'Check your availability', 'I need party makeup', 'What products do you use?'].map((t) => GestureDetector(onTap: () => _send(t), child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: kPrimaryMid)), child: Text(t, style: const TextStyle(fontSize: 11, color: kPrimaryDark, fontWeight: FontWeight.w500))))).toList()))),
      Expanded(child: ListView.builder(controller: _scroll, padding: const EdgeInsets.all(12), itemCount: _msgs.length + (_typing ? 1 : 0), itemBuilder: (ctx, i) {
        if (i == _msgs.length) return Padding(padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4), child: Row(children: [CircleAvatar(radius: 14, backgroundColor: stylistBg(widget.stylist.avatarColor), child: Text(widget.stylist.avatarInitials, style: TextStyle(color: stylistFg(widget.stylist.avatarColor), fontSize: 10, fontWeight: FontWeight.w600))), const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: const TypingDots())]));
        final msg = _msgs[i];
        return Align(alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: const EdgeInsets.only(bottom: 10), constraints: BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 0.75), child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
          if (!msg.isUser) ...[CircleAvatar(radius: 14, backgroundColor: stylistBg(widget.stylist.avatarColor), child: Text(widget.stylist.avatarInitials, style: TextStyle(color: stylistFg(widget.stylist.avatarColor), fontSize: 10, fontWeight: FontWeight.w600))), const SizedBox(width: 6)],
          Flexible(child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: msg.isUser ? kPrimary : Colors.white, borderRadius: BorderRadius.only(topLeft: const Radius.circular(16), topRight: const Radius.circular(16), bottomLeft: Radius.circular(msg.isUser ? 16 : 4), bottomRight: Radius.circular(msg.isUser ? 4 : 16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))]), child: Text(msg.text, style: TextStyle(fontSize: 13, color: msg.isUser ? Colors.white : Colors.black87, height: 1.4)))),
          if (msg.isUser) const SizedBox(width: 4),
        ])));
      })),
      Container(color: Colors.white, padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: MediaQuery.of(c).viewInsets.bottom + 12), child: Row(children: [
        Expanded(child: TextField(controller: _ctrl, onSubmitted: _send, textInputAction: TextInputAction.send, decoration: InputDecoration(hintText: 'Ask about look, availability...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12), filled: true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
        const SizedBox(width: 8),
        GestureDetector(onTap: () => _send(_ctrl.text), child: Container(width: 44, height: 44, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.send_rounded, color: Colors.white, size: 20))),
      ])),
    ]),
  );
  @override void dispose() { _ctrl.dispose(); _scroll.dispose(); super.dispose(); }
}

class PlannerChatScreen extends StatefulWidget {
  final Planner planner;
  const PlannerChatScreen({super.key, required this.planner});
  @override State<PlannerChatScreen> createState() => _PlannerChatState();
}
class _PlannerChatState extends State<PlannerChatScreen> {
  final List<ChatMsg> _msgs = [];
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();
  bool _typing = false;

  final List<List<String>> _replies = [
    ['Hello! I am so excited to plan your special day. Tell me about your event — date, guest count, and vision!', 'Hi! Great to connect. What type of wedding are you envisioning — intimate or grand celebration?'],
    ['That sounds absolutely magical! We have handled many such events. What is your approximate budget range?', 'Wonderful! We offer full planning as well as partial assistance. Which services interest you most?'],
    ['We cover everything — venue, decor, catering, invitations, and day coordination. Completely stress-free!', 'Our team handles all vendors and logistics. You just enjoy the celebration!'],
    ['We are available for your date! Our packages start from Rs {price}. Shall we schedule a detailed consultation call?', 'Great news — your date is open! We can send you a detailed proposal within 24 hours.'],
    ['Please use the Book / Enquire button above to send us your details. We will reach out within 2 hours!', 'We are looking forward to making your dream event a reality. Send your enquiry through the app!'],
  ];

  @override
  void initState() {
    super.initState();
    _msgs.add(ChatMsg(text: 'Namaste! I am ${widget.planner.name} 🙏\n\nWe specialise in: ${widget.planner.services.join(', ')}\n\nTell me about your dream event — date, location, and vision!', isUser: false));
  }

  String _reply(int count) {
    final idx = (count ~/ 2).clamp(0, _replies.length - 1);
    final list = _replies[idx];
    return list[Random().nextInt(list.length)].replaceAll('{price}', widget.planner.priceFrom.toString());
  }

  void _send(String text) {
    if (text.trim().isEmpty) return;
    final count = _msgs.length;
    setState(() { _msgs.add(ChatMsg(text: text, isUser: true)); _typing = true; });
    _ctrl.clear();
    Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() { _typing = false; _msgs.add(ChatMsg(text: _reply(count), isUser: false)); });
      Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    });
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF5F5F5),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)),
      title: Row(children: [
        CircleAvatar(radius: 18, backgroundColor: kPrimaryLight, child: Text(widget.planner.avatarInitials, style: const TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w600, fontSize: 12))),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.planner.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const Text('Pre-Booking Chat', style: TextStyle(fontSize: 11, color: Colors.grey))]),
      ]),
      actions: [TextButton.icon(onPressed: () { ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Enquiry sent! Planner will contact you soon.'), backgroundColor: kPrimary)); }, icon: const Icon(Icons.send_outlined, size: 14, color: kPrimary), label: const Text('Enquire', style: TextStyle(color: kPrimary, fontSize: 12, fontWeight: FontWeight.w600)), style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10)))],
    ),
    body: Column(children: [
      Container(color: kAmberLight, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: const Row(children: [Icon(Icons.info_outline, color: kAmber, size: 16), SizedBox(width: 8), Expanded(child: Text('Chat with the planner before sending an enquiry!', style: TextStyle(fontSize: 11, color: kAmber)))])),
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: ['Full wedding planning', 'Destination wedding', 'What is included?', 'Budget range?', 'Your availability?'].map((t) => GestureDetector(onTap: () => _send(t), child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: kPrimaryMid)), child: Text(t, style: const TextStyle(fontSize: 11, color: kPrimaryDark, fontWeight: FontWeight.w500))))).toList()))),
      Expanded(child: ListView.builder(controller: _scroll, padding: const EdgeInsets.all(12), itemCount: _msgs.length + (_typing ? 1 : 0), itemBuilder: (ctx, i) {
        if (i == _msgs.length) return Padding(padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4), child: Row(children: [const CircleAvatar(radius: 14, backgroundColor: kPrimaryLight, child: Text('P', style: TextStyle(color: kPrimaryDark, fontSize: 10, fontWeight: FontWeight.w600))), const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: const TypingDots())]));
        final msg = _msgs[i];
        return Align(alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: const EdgeInsets.only(bottom: 10), constraints: BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 0.75), child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
          if (!msg.isUser) ...[const CircleAvatar(radius: 14, backgroundColor: kPrimaryLight, child: Icon(Icons.celebration_outlined, color: kPrimaryDark, size: 14)), const SizedBox(width: 6)],
          Flexible(child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: msg.isUser ? kPrimary : Colors.white, borderRadius: BorderRadius.only(topLeft: const Radius.circular(16), topRight: const Radius.circular(16), bottomLeft: Radius.circular(msg.isUser ? 16 : 4), bottomRight: Radius.circular(msg.isUser ? 4 : 16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))]), child: Text(msg.text, style: TextStyle(fontSize: 13, color: msg.isUser ? Colors.white : Colors.black87, height: 1.4)))),
          if (msg.isUser) const SizedBox(width: 4),
        ])));
      })),
      Container(color: Colors.white, padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: MediaQuery.of(c).viewInsets.bottom + 12), child: Row(children: [
        Expanded(child: TextField(controller: _ctrl, onSubmitted: _send, textInputAction: TextInputAction.send, decoration: InputDecoration(hintText: 'Ask about services, pricing...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12), filled: true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
        const SizedBox(width: 8),
        GestureDetector(onTap: () => _send(_ctrl.text), child: Container(width: 44, height: 44, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: const Icon(Icons.send_rounded, color: Colors.white, size: 20))),
      ])),
    ]),
  );
  @override void dispose() { _ctrl.dispose(); _scroll.dispose(); super.dispose(); }
}

class InfluencerChatScreen extends StatefulWidget {
  final Influencer influencer;
  const InfluencerChatScreen({super.key, required this.influencer});
  @override State<InfluencerChatScreen> createState() => _InfluencerChatState();
}
class _InfluencerChatState extends State<InfluencerChatScreen> {
  final List<ChatMsg> _msgs = [];
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();
  bool _typing = false;

  final List<String> _replies = [
    'Hey gorgeous! So glad you reached out. What is the occasion and what look are you going for?',
    'Love that vibe! I can totally help you nail that look. Do you have any reference photos?',
    'My session includes a full styling consultation and lookbook suggestions. Everything is personalised for you!',
    'My rate is Rs {price} per session which includes consultation, style guide, and follow-up! Great value!',
    'Please book me through the app and I will send you a detailed prep guide before our session!',
  ];

  @override
  void initState() {
    super.initState();
    _msgs.add(ChatMsg(text: 'Hey! I am ${widget.influencer.name} (${widget.influencer.handle}) ✨\n\nI specialise in: ${widget.influencer.tags.join(', ')}\n\nTell me — what look are you going for? I love helping people find their perfect style!', isUser: false));
  }

  String _reply(int count) {
    final idx = (count ~/ 2).clamp(0, _replies.length - 1);
    return _replies[idx].replaceAll('{price}', widget.influencer.pricePerSession.toString());
  }

  void _send(String text) {
    if (text.trim().isEmpty) return;
    final count = _msgs.length;
    setState(() { _msgs.add(ChatMsg(text: text, isUser: true)); _typing = true; });
    _ctrl.clear();
    Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() { _typing = false; _msgs.add(ChatMsg(text: _reply(count), isUser: false)); });
      Future.delayed(const Duration(milliseconds: 100), () { if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut); });
    });
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF5F5F5),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)),
      title: Row(children: [
        CircleAvatar(radius: 18, backgroundColor: kAmberLight, child: Text(widget.influencer.avatarInitials, style: const TextStyle(color: kAmber, fontWeight: FontWeight.w600, fontSize: 12))),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.influencer.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), Text(widget.influencer.handle, style: const TextStyle(fontSize: 11, color: kPrimary))]),
      ]),
      actions: [TextButton.icon(onPressed: () { ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${widget.influencer.name} booking request sent!'), backgroundColor: kAmber)); }, icon: const Icon(Icons.calendar_today_outlined, size: 14, color: kAmber), label: const Text('Book', style: TextStyle(color: kAmber, fontSize: 12, fontWeight: FontWeight.w600)), style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10)))],
    ),
    body: Column(children: [
      Container(color: kAmberLight, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: const Row(children: [Icon(Icons.info_outline, color: kAmber, size: 16), SizedBox(width: 8), Expanded(child: Text('Chat with the influencer before booking a session!', style: TextStyle(fontSize: 11, color: kAmber)))])),
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: ['Bridal look ideas', 'Party outfit help', 'What is included?', 'Rate per session?', 'Can you collab?'].map((t) => GestureDetector(onTap: () => _send(t), child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: kAmber.withOpacity(0.3))), child: Text(t, style: const TextStyle(fontSize: 11, color: kAmber, fontWeight: FontWeight.w500))))).toList()))),
      Expanded(child: ListView.builder(controller: _scroll, padding: const EdgeInsets.all(12), itemCount: _msgs.length + (_typing ? 1 : 0), itemBuilder: (ctx, i) {
        if (i == _msgs.length) return Padding(padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4), child: Row(children: [const CircleAvatar(radius: 14, backgroundColor: kAmberLight, child: Icon(Icons.people_outline, color: kAmber, size: 14)), const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: const TypingDots())]));
        final msg = _msgs[i];
        return Align(alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: const EdgeInsets.only(bottom: 10), constraints: BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 0.75), child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
          if (!msg.isUser) ...[const CircleAvatar(radius: 14, backgroundColor: kAmberLight, child: Icon(Icons.people_outline, color: kAmber, size: 14)), const SizedBox(width: 6)],
          Flexible(child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: msg.isUser ? kPrimary : Colors.white, borderRadius: BorderRadius.only(topLeft: const Radius.circular(16), topRight: const Radius.circular(16), bottomLeft: Radius.circular(msg.isUser ? 16 : 4), bottomRight: Radius.circular(msg.isUser ? 4 : 16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))]), child: Text(msg.text, style: TextStyle(fontSize: 13, color: msg.isUser ? Colors.white : Colors.black87, height: 1.4)))),
          if (msg.isUser) const SizedBox(width: 4),
        ])));
      })),
      Container(color: Colors.white, padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: MediaQuery.of(c).viewInsets.bottom + 12), child: Row(children: [
        Expanded(child: TextField(controller: _ctrl, onSubmitted: _send, textInputAction: TextInputAction.send, decoration: InputDecoration(hintText: 'Ask about style, collab...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12), filled: true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
        const SizedBox(width: 8),
        GestureDetector(onTap: () => _send(_ctrl.text), child: Container(width: 44, height: 44, decoration: const BoxDecoration(color: kAmber, shape: BoxShape.circle), child: const Icon(Icons.send_rounded, color: Colors.white, size: 20))),
      ])),
    ]),
  );
  @override void dispose() { _ctrl.dispose(); _scroll.dispose(); super.dispose(); }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override State<SearchScreen> createState() => _SearchState();
}
class _SearchState extends State<SearchScreen> {
  final _ctrl = TextEditingController();
  String _q = '';
  String _tab = 'Stylists';
  List<Stylist> get _fS => mockStylists.where((s) => s.name.toLowerCase().contains(_q.toLowerCase()) || s.city.toLowerCase().contains(_q.toLowerCase()) || s.specialty.toLowerCase().contains(_q.toLowerCase()) || s.tags.any((t) => t.toLowerCase().contains(_q.toLowerCase()))).toList();
  List<Planner> get _fP => mockPlanners.where((p) => p.name.toLowerCase().contains(_q.toLowerCase()) || p.city.toLowerCase().contains(_q.toLowerCase()) || p.specialty.toLowerCase().contains(_q.toLowerCase())).toList();
  List<Shop> get _fSh => mockShops.where((s) => s.name.toLowerCase().contains(_q.toLowerCase()) || s.city.toLowerCase().contains(_q.toLowerCase()) || s.category.toLowerCase().contains(_q.toLowerCase()) || s.tags.any((t) => t.toLowerCase().contains(_q.toLowerCase()))).toList();

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)),
      title: TextField(controller: _ctrl, autofocus: true, onChanged: (v) => setState(() => _q = v), decoration: InputDecoration(hintText: 'Search stylists, planners, shops...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14), border: InputBorder.none, suffixIcon: _q.isNotEmpty ? IconButton(icon: const Icon(Icons.clear, size: 18, color: Colors.grey), onPressed: () { _ctrl.clear(); setState(() => _q = ''); }) : null)),
    ),
    body: Column(children: [
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: Row(children: ['Stylists', 'Planners', 'Shops'].map((t) { final sel = t == _tab; return Padding(padding: const EdgeInsets.only(right: 8), child: GestureDetector(onTap: () => setState(() => _tab = t), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: sel ? kPrimary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: sel ? kPrimary : Colors.grey.shade300)), child: Text(t, style: TextStyle(color: sel ? Colors.white : Colors.grey.shade600, fontSize: 13, fontWeight: sel ? FontWeight.w600 : FontWeight.normal))))); }).toList())),
      Expanded(child: _q.isEmpty ? _sug() : _res()),
    ]),
  );

  Widget _sug() => ListView(padding: const EdgeInsets.all(16), children: [
    const Text('Popular Searches', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey)), const SizedBox(height: 12),
    Wrap(spacing: 8, runSpacing: 8, children: ['Bridal Makeup', 'Saree Draping', 'Wedding Planner', 'Sherwani', 'Mehendi', 'Jewellery', 'Lehenga', 'Party Makeup'].map((s) => GestureDetector(onTap: () { _ctrl.text = s; setState(() => _q = s); }, child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.search, size: 14, color: kPrimaryDark), const SizedBox(width: 6), Text(s, style: const TextStyle(color: kPrimaryDark, fontSize: 13))])))).toList()),
    const SizedBox(height: 20),
    const Text('Trending Stylists', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey)), const SizedBox(height: 12),
    ...mockStylists.take(3).map((s) => ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4), leading: CircleAvatar(backgroundColor: stylistBg(s.avatarColor), child: Text(s.avatarInitials, style: TextStyle(color: stylistFg(s.avatarColor), fontWeight: FontWeight.w600, fontSize: 13))), title: Text(s.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), subtitle: Text('${s.specialty} · ${s.city}', style: const TextStyle(fontSize: 12, color: Colors.grey)), trailing: Text('Rs ${s.pricePerHour}/hr', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: kPrimaryDark)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StylistDetailScreen(stylist: s))))),
  ]);

  Widget _res() {
    if (_tab == 'Stylists') {
      if (_fS.isEmpty) return _empty();
      return ListView.builder(padding: const EdgeInsets.all(16), itemCount: _fS.length, itemBuilder: (ctx, i) => StylistCard(stylist: _fS[i], onBook: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => BookingScreen(stylist: _fS[i]))), onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => StylistDetailScreen(stylist: _fS[i])))));
    } else if (_tab == 'Planners') {
      if (_fP.isEmpty) return _empty();
      return ListView.builder(padding: const EdgeInsets.all(16), itemCount: _fP.length, itemBuilder: (ctx, i) => PlannerCard(p: _fP[i]));
    } else {
      if (_fSh.isEmpty) return _empty();
      return ListView.builder(padding: const EdgeInsets.all(16), itemCount: _fSh.length, itemBuilder: (ctx, i) {
        final s = _fSh[i];
        return Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [CircleAvatar(radius: 24, backgroundColor: stylistBg(s.avatarColor), child: Text(s.avatarInitials, style: TextStyle(color: stylistFg(s.avatarColor), fontWeight: FontWeight.w700, fontSize: 13))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(s.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), Text(s.address, style: const TextStyle(fontSize: 11, color: Colors.grey)), Row(children: [const Icon(Icons.star, size: 12, color: kGold), Text('${s.rating}', style: const TextStyle(fontSize: 11, color: Colors.grey))])])), if (s.partnered) Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(8)), child: const Text('Partner', style: TextStyle(color: kAmber, fontSize: 9, fontWeight: FontWeight.w700)))])));
      });
    }
  }

  Widget _empty() => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search_off, size: 56, color: Colors.grey.shade300), const SizedBox(height: 16), Text('No results for "$_q"', style: const TextStyle(color: Colors.grey, fontSize: 14)), const SizedBox(height: 8), const Text('Try a different keyword', style: TextStyle(color: Colors.grey, fontSize: 12))]));
}

class StylistDetailScreen extends StatefulWidget {
  final Stylist stylist;
  const StylistDetailScreen({super.key, required this.stylist});
  @override State<StylistDetailScreen> createState() => _StylistDetailState();
}
class _StylistDetailState extends State<StylistDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _t;
  bool get isSaved => AppState.savedStylistIds.contains(widget.stylist.id);
  List<PortfolioItem> get portfolio => mockPortfolios[widget.stylist.id] ?? [];
  List<bool> get avail => mockAvailability[widget.stylist.id] ?? List.filled(7, true);
  List<StylistReview> get reviews => mockStylistReviews[widget.stylist.id] ?? [];
  @override void initState() { super.initState(); _t = TabController(length: 3, vsync: this); }
  @override void dispose() { _t.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    body: NestedScrollView(
      headerSliverBuilder: (ctx, _) => [
        SliverAppBar(expandedHeight: 220, pinned: true, backgroundColor: const Color(0xFF8B1A3D),
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(c)),
          actions: [IconButton(icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline, color: Colors.white), onPressed: () { setState(() => AppState.toggleSave(widget.stylist.id)); ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(isSaved ? 'Removed from saved' : 'Saved!'), backgroundColor: kPrimary, duration: const Duration(seconds: 1))); }), IconButton(icon: const Icon(Icons.share_outlined, color: Colors.white), onPressed: () {})],
          flexibleSpace: FlexibleSpaceBar(background: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF8B1A3D), Color(0xFFD4537E), Color(0xFFE8809A)], begin: Alignment.topLeft, end: Alignment.bottomRight)), child: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const SizedBox(height: 40), CircleAvatar(radius: 44, backgroundColor: stylistBg(widget.stylist.avatarColor), child: Text(widget.stylist.avatarInitials, style: TextStyle(color: stylistFg(widget.stylist.avatarColor), fontWeight: FontWeight.w700, fontSize: 26))), const SizedBox(height: 10), Text(widget.stylist.name, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)), const SizedBox(height: 4), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.location_on, size: 14, color: Colors.white70), Text(widget.stylist.city, style: const TextStyle(color: Colors.white70, fontSize: 13)), const SizedBox(width: 12), const Icon(Icons.star, size: 14, color: kGold), Text('${widget.stylist.rating} (${widget.stylist.reviews})', style: const TextStyle(color: Colors.white70, fontSize: 13))])])))),
        ),
        SliverToBoxAdapter(child: Container(color: const Color(0xFF2a0a14), padding: const EdgeInsets.symmetric(vertical: 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_st('${widget.stylist.reviews}+', 'Reviews'), _st(widget.stylist.specialty, 'Specialty'), _st('Rs ${widget.stylist.pricePerHour}/hr', 'Rate'), _st(widget.stylist.available ? 'Available' : 'Busy', 'Status')]))),
        SliverToBoxAdapter(child: Container(color: Colors.white, child: TabBar(controller: _t, labelColor: kPrimary, unselectedLabelColor: Colors.grey, indicatorColor: kPrimary, tabs: const [Tab(text: 'Portfolio'), Tab(text: 'Availability'), Tab(text: 'Reviews')]))),
      ],
      body: TabBarView(controller: _t, children: [_portfolioTab(c), _availabilityTab(c), _reviewsTab(c)]),
    ),
    bottomNavigationBar: Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, -4))]),
      child: Row(children: [
        Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => PreBookChatScreen(stylist: widget.stylist))), icon: const Icon(Icons.chat_bubble_outline, size: 16), label: const Text('Chat First', style: TextStyle(fontSize: 13)), style: OutlinedButton.styleFrom(foregroundColor: kPrimary, side: const BorderSide(color: kPrimary), padding: const EdgeInsets.symmetric(vertical: 13), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
        const SizedBox(width: 10),
        Expanded(flex: 2, child: ElevatedButton(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => BookingScreen(stylist: widget.stylist))), style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Book Now', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)))),
      ]),
    ),
  );

  Widget _st(String v, String l) => Column(children: [Text(v, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)), Text(l, style: const TextStyle(color: Colors.white54, fontSize: 9))]);

  Widget _portfolioTab(BuildContext c) => ListView(padding: const EdgeInsets.all(16), children: [
    Row(children: [const Expanded(child: Text('Past Work', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))), Text('${portfolio.length} projects', style: const TextStyle(color: Colors.grey, fontSize: 12))]),
    const SizedBox(height: 4), const Text('Real work done by this stylist for previous clients', style: TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(height: 16),
    if (portfolio.isEmpty) Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Center(child: Text('No portfolio items yet.', style: TextStyle(color: Colors.grey)))),
    ...portfolio.map((p) => Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 140, width: double.infinity, decoration: BoxDecoration(color: p.color, borderRadius: const BorderRadius.vertical(top: Radius.circular(16))), child: Stack(children: [Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(p.emoji, style: const TextStyle(fontSize: 52)), const SizedBox(height: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(20)), child: Text(p.label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF333333))))])), Positioned(top: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: kTealLight, borderRadius: BorderRadius.circular(8)), child: const Row(children: [Icon(Icons.verified, color: kTeal, size: 12), SizedBox(width: 3), Text('Real Work', style: TextStyle(color: kTeal, fontSize: 9, fontWeight: FontWeight.w700))])))])),
      Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p.label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(p.description, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.4)), const SizedBox(height: 8), const Row(children: [Icon(Icons.thumb_up_outlined, size: 14, color: Colors.grey), SizedBox(width: 4), Text('Client loved this look', style: TextStyle(fontSize: 11, color: Colors.grey))])])),
    ]))),
    const SizedBox(height: 80),
  ]);

  Widget _availabilityTab(BuildContext c) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final fullDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final availDays = List.generate(7, (i) => avail[i]).asMap().entries.where((e) => e.value).map((e) => fullDays[e.key]).toList();
    return ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Weekly Schedule', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 4), const Text('Days when this stylist is available', style: TextStyle(fontSize: 12, color: Colors.grey)), const SizedBox(height: 16),
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(7, (i) => Column(children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: avail[i] ? kPrimary : Colors.grey.shade200, shape: BoxShape.circle), alignment: Alignment.center, child: Text(days[i], style: TextStyle(color: avail[i] ? Colors.white : Colors.grey, fontSize: 11, fontWeight: FontWeight.w600))), const SizedBox(height: 6), Icon(avihidden[i] ? Icons.check_circle : Icons.cancel, size: 14, color: avail[i] ? kTeal : Colors.grey.shade400)])))),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: kTealLight, borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.info_outline, color: kTeal, size: 18), const SizedBox(width: 10), Expanded(child: Text('Available on: ${availDays.join(', ')}', style: const TextStyle(color: kTeal, fontSize: 12, fontWeight: FontWeight.w500)))])),
      const SizedBox(height: 20),
      const Text('Booking Slots (Today)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
      ...['9:00 AM', '11:00 AM', '2:00 PM', '4:00 PM', '6:00 PM'].asMap().entries.map((e) { final busy = e.key == 1 || e.key == 3; return Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), decoration: BoxDecoration(color: busy ? Colors.grey.shade50 : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: busy ? Colors.grey.shade200 : kPrimaryMid)), child: Row(children: [Icon(Icons.access_time, size: 16, color: busy ? Colors.grey : kPrimary), const SizedBox(width: 10), Text(e.value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: busy ? Colors.grey : Colors.black)), const Spacer(), Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: busy ? Colors.grey.shade100 : kPrimaryLight, borderRadius: BorderRadius.circular(20)), child: Text(busy ? 'Booked' : 'Available', style: TextStyle(color: busy ? Colors.grey : kPrimaryDark, fontSize: 11, fontWeight: FontWeight.w600)))])); }),
      const SizedBox(height: 80),
    ]);
  }

  Widget _reviewsTab(BuildContext c) => ListView(padding: const EdgeInsets.all(16), children: [
    Row(children: [const Expanded(child: Text('Client Reviews', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))), Text('${reviews.length} reviews', style: const TextStyle(color: Colors.grey, fontSize: 12))]),
    const SizedBox(height: 4),
    Container(margin: const EdgeInsets.symmetric(vertical: 12), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [Column(children: [Text('${widget.stylist.rating}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: kPrimaryDark)), Row(children: List.generate(5, (i) => Icon(Icons.star, size: 16, color: i < widget.stylist.rating.round() ? kGold : Colors.grey.shade300))), Text('${widget.stylist.reviews} total', style: const TextStyle(color: Colors.grey, fontSize: 11))]), const SizedBox(width: 20), Expanded(child: Column(children: [_rbar('5★', 0.8), _rbar('4★', 0.15), _rbar('3★', 0.04), _rbar('2★', 0.01), _rbar('1★', 0.0)]))])),
    SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () => _feedbackSheet(c), icon: const Icon(Icons.rate_review_outlined, size: 18), label: const Text('Write a Review', style: TextStyle(fontSize: 14)), style: OutlinedButton.styleFrom(foregroundColor: kPrimary, side: const BorderSide(color: kPrimary), padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
    const SizedBox(height: 16),
    if (reviews.isEmpty) Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Center(child: Text('No reviews yet. Be the first!', style: TextStyle(color: Colors.grey)))),
    ...reviews.map((r) => Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(radius: 18, backgroundColor: kPrimaryLight, child: Text(r.clientName[0], style: const TextStyle(color: kPrimaryDark, fontSize: 13, fontWeight: FontWeight.w600))), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(r.clientName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), Text(r.date, style: const TextStyle(fontSize: 11, color: Colors.grey))])), Row(children: List.generate(5, (i) => Icon(Icons.star, size: 13, color: i < r.rating ? kGold : Colors.grey.shade300)))]), const SizedBox(height: 8), Text(r.text, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.5))]))),
    const SizedBox(height: 80),
  ]);

  Widget _rbar(String l, double p) => Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: Row(children: [Text(l, style: const TextStyle(fontSize: 10, color: Colors.grey)), const SizedBox(width: 8), Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(value: p, minHeight: 6, backgroundColor: Colors.grey.shade200, valueColor: const AlwaysStoppedAnimation<Color>(kPrimary))))]));

  // ignore: non_constant_identifier_names
  List<bool> get avihidden => avail;

  void _feedbackSheet(BuildContext c) {
    int selR = 5;
    final fc = TextEditingController();
    showModalBottomSheet(context: c, isScrollControlled: true, backgroundColor: Colors.white, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))), builder: (ctx) => StatefulBuilder(builder: (ctx, ss) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom, left: 20, right: 20, top: 20),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Expanded(child: Text('Write a Review', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))), IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx))]),
        const SizedBox(height: 4), Text('Share your experience with ${widget.stylist.name}', style: const TextStyle(color: Colors.grey, fontSize: 13)), const SizedBox(height: 16),
        const Text('Your Rating', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(5, (i) => GestureDetector(onTap: () => ss(() => selR = i + 1), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.star, size: 36, color: i < selR ? kGold : Colors.grey.shade300))))),
        const SizedBox(height: 16), const Text('Your Review', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), const SizedBox(height: 8),
        TextField(controller: fc, maxLines: 4, decoration: InputDecoration(hintText: 'Describe your experience...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)))),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { if (fc.text.trim().isEmpty) { ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content: Text('Please write your review'), backgroundColor: kPrimary)); return; } mockStylistReviews[widget.stylist.id]?.insert(0, StylistReview(clientName: AppState.userName ?? 'You', text: fc.text, date: 'Apr 2025', rating: selR)); Navigator.pop(ctx); setState(() {}); ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Review submitted! Thank you'), backgroundColor: kTeal)); }, style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Submit Review', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)))),
        const SizedBox(height: 20),
      ]),
    )));
  }
}

class StylistsPage extends StatefulWidget {
  const StylistsPage({super.key});
  @override State<StylistsPage> createState() => _StylistsPageState();
}
class _StylistsPageState extends State<StylistsPage> {
  String _f = 'All';
  final filters = ['All', 'Clothing', 'Makeup', 'Jewellery', 'Bridal'];
  List<Stylist> get fil { if (_f == 'All') return mockStylists; if (_f == 'Bridal') return mockStylists.where((s) => s.tags.contains('Bridal')).toList(); return mockStylists.where((s) => s.specialty == _f).toList(); }
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Stylists', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), actions: [IconButton(icon: const Icon(Icons.search), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const SearchScreen())))]),
    body: Column(children: [
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: filters.map((f) { final s = f == _f; return Padding(padding: const EdgeInsets.only(right: 8), child: GestureDetector(onTap: () => setState(() => _f = f), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: s ? kPrimary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: s ? kPrimary : Colors.grey.shade300)), child: Text(f, style: TextStyle(color: s ? Colors.white : Colors.grey.shade600, fontSize: 13, fontWeight: s ? FontWeight.w600 : FontWeight.normal))))); }).toList()))),
      Expanded(child: ListView.builder(padding: const EdgeInsets.all(16), itemCount: fil.length, itemBuilder: (ctx, i) => StylistCard(stylist: fil[i], onBook: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => BookingScreen(stylist: fil[i]))), onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => StylistDetailScreen(stylist: fil[i])))))),
    ]),
  );
}

class StylistCard extends StatefulWidget {
  final Stylist stylist;
  final VoidCallback onBook;
  final VoidCallback? onTap;
  const StylistCard({super.key, required this.stylist, required this.onBook, this.onTap});
  @override State<StylistCard> createState() => _StylistCardState();
}
class _StylistCardState extends State<StylistCard> {
  bool get isSaved => AppState.savedStylistIds.contains(widget.stylist.id);
  @override
  Widget build(BuildContext c) => GestureDetector(
    onTap: widget.onTap,
    child: Container(margin: const EdgeInsets.fromLTRB(16, 0, 16, 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]),
      child: Padding(padding: const EdgeInsets.all(16), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 28, backgroundColor: stylistBg(widget.stylist.avatarColor), child: Text(widget.stylist.avatarInitials, style: TextStyle(color: stylistFg(widget.stylist.avatarColor), fontWeight: FontWeight.w600, fontSize: 16))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Expanded(child: Text(widget.stylist.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))), if (widget.stylist.available) kPill('Available', kTealLight, kTeal)]),
          const SizedBox(height: 2),
          Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.grey), Text(widget.stylist.city, style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(width: 8), const Icon(Icons.star, size: 12, color: kGold), Text('${widget.stylist.rating} (${widget.stylist.reviews})', style: const TextStyle(color: Colors.grey, fontSize: 12))]),
          const SizedBox(height: 8),
          Wrap(spacing: 6, runSpacing: 4, children: widget.stylist.tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)), child: Text(t, style: TextStyle(fontSize: 10, color: Colors.grey.shade700)))).toList()),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Rs ${widget.stylist.pricePerHour}/hr', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            Row(children: [
              GestureDetector(onTap: () { setState(() => AppState.toggleSave(widget.stylist.id)); ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(isSaved ? 'Removed from saved' : 'Saved!'), backgroundColor: kPrimary, duration: const Duration(seconds: 1))); }, child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: isSaved ? kPrimaryLight : Colors.grey.shade100, borderRadius: BorderRadius.circular(20)), child: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline, size: 16, color: isSaved ? kPrimary : Colors.grey))),
              ElevatedButton(onPressed: widget.onBook, style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Book Now', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
            ]),
          ]),
        ])),
      ])),
    ),
  );
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override State<ExplorePage> createState() => _ExploreState();
}
class _ExploreState extends State<ExplorePage> with SingleTickerProviderStateMixin {
  late TabController _t;
  @override void initState() { super.initState(); _t = TabController(length: 2, vsync: this); }
  @override void dispose() { _t.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, title: const Text('Explore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), actions: [IconButton(icon: const Icon(Icons.search), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const SearchScreen())))], bottom: TabBar(controller: _t, labelColor: kPrimary, unselectedLabelColor: Colors.grey, indicatorColor: kPrimary, tabs: const [Tab(text: 'Wedding Planners'), Tab(text: 'Influencers')])),
    body: TabBarView(controller: _t, children: const [PlannersListView(), InfluencersListView()]),
  );
}

class PlannersPage extends StatelessWidget {
  const PlannersPage({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(backgroundColor: const Color(0xFFF8F8F8), appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Wedding Planners', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))), body: const PlannersListView());
}
class PlannersListView extends StatelessWidget {
  const PlannersListView({super.key});
  @override Widget build(BuildContext c) => ListView.builder(padding: const EdgeInsets.all(16), itemCount: mockPlanners.length, itemBuilder: (ctx, i) => PlannerCard(p: mockPlanners[i]));
}

class PlannerCard extends StatelessWidget {
  final Planner p;
  const PlannerCard({super.key, required this.p});
  @override
  Widget build(BuildContext c) => Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]),
    child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [CircleAvatar(radius: 26, backgroundColor: kPrimaryLight, child: Text(p.avatarInitials, style: const TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w700, fontSize: 15))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(p.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))), if (p.available) kPill('Available', kTealLight, kTeal)]), Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.grey), Text(p.city, style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(width: 6), const Icon(Icons.star, size: 12, color: kGold), Text('${p.rating} (${p.reviews})', style: const TextStyle(color: Colors.grey, fontSize: 12))])]))],),
      const SizedBox(height: 10), Text(p.about, style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.4)), const SizedBox(height: 10),
      Wrap(spacing: 6, runSpacing: 4, children: p.services.map((s) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(8)), child: Text(s, style: const TextStyle(color: kPrimaryDark, fontSize: 10, fontWeight: FontWeight.w500)))).toList()),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Starting from', style: TextStyle(color: Colors.grey, fontSize: 11)), Text('Rs ${p.priceFrom}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kPrimaryDark))]),
        Row(children: [
          OutlinedButton.icon(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => PlannerChatScreen(planner: p))), icon: const Icon(Icons.chat_bubble_outline, size: 14, color: kPrimary), label: const Text('Chat', style: TextStyle(color: kPrimary, fontSize: 12)), style: OutlinedButton.styleFrom(foregroundColor: kPrimary, side: const BorderSide(color: kPrimary), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: () { ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Enquiry sent! Planner will contact you soon.'), backgroundColor: kPrimary)); }, style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8)), child: const Text('Enquire', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
        ]),
      ]),
    ])));
}

class InfluencersPage extends StatelessWidget {
  const InfluencersPage({super.key});
  @override Widget build(BuildContext c) => Scaffold(backgroundColor: const Color(0xFFF8F8F8), appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Influencers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))), body: const InfluencersListView());
}
class InfluencersListView extends StatelessWidget {
  const InfluencersListView({super.key});
  @override Widget build(BuildContext c) => ListView.builder(padding: const EdgeInsets.all(16), itemCount: mockInfluencers.length, itemBuilder: (ctx, i) => InfCard(inf: mockInfluencers[i]));
}

class InfCard extends StatelessWidget {
  final Influencer inf;
  const InfCard({super.key, required this.inf});
  @override
  Widget build(BuildContext c) => Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]),
    child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [CircleAvatar(radius: 26, backgroundColor: kAmberLight, child: Text(inf.avatarInitials, style: const TextStyle(color: kAmber, fontWeight: FontWeight.w700, fontSize: 15))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(inf.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))), if (inf.available) kPill('Available', kTealLight, kTeal)]), Text(inf.handle, style: const TextStyle(color: kPrimary, fontSize: 12, fontWeight: FontWeight.w500)), Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.grey), Text(inf.city, style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(width: 6), const Icon(Icons.people_outline, size: 12, color: Colors.grey), Text('${(inf.followers / 1000).toStringAsFixed(0)}K followers', style: const TextStyle(color: Colors.grey, fontSize: 12))])]))],),
      const SizedBox(height: 10),
      Wrap(spacing: 6, runSpacing: 4, children: inf.tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(8)), child: Text(t, style: const TextStyle(color: kAmber, fontSize: 10, fontWeight: FontWeight.w500)))).toList()),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Per Session', style: TextStyle(color: Colors.grey, fontSize: 11)), Text('Rs ${inf.pricePerSession}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kAmber))]),
        Row(children: [
          OutlinedButton.icon(onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => InfluencerChatScreen(influencer: inf))), icon: const Icon(Icons.chat_bubble_outline, size: 14, color: kAmber), label: const Text('Chat', style: TextStyle(color: kAmber, fontSize: 12)), style: OutlinedButton.styleFrom(foregroundColor: kAmber, side: const BorderSide(color: kAmber), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: () { ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${inf.name} booking request sent!'), backgroundColor: kPrimary)); }, style: ElevatedButton.styleFrom(backgroundColor: kAmber, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8)), child: const Text('Book Session', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
        ]),
      ]),
    ])));
}

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});
  @override State<ShopsPage> createState() => _ShopsState();
}
class _ShopsState extends State<ShopsPage> {
  String _f = 'All';
  final cats = ['All', 'Clothing', 'Jewellery', 'Makeup', 'Menswear', 'Mehendi'];
  List<Shop> get fil => _f == 'All' ? mockShops : mockShops.where((s) => s.category == _f).toList();
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, title: const Text('Partner Shops', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), actions: [IconButton(icon: const Icon(Icons.search), onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => const SearchScreen())))]),
    body: Column(children: [
      Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: cats.map((x) { final s = x == _f; return Padding(padding: const EdgeInsets.only(right: 8), child: GestureDetector(onTap: () => setState(() => _f = x), child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7), decoration: BoxDecoration(color: s ? kPrimary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: s ? kPrimary : Colors.grey.shade300)), child: Text(x, style: TextStyle(color: s ? Colors.white : Colors.grey.shade600, fontSize: 12, fontWeight: s ? FontWeight.w600 : FontWeight.normal))))); }).toList()))),
      Expanded(child: ListView.builder(padding: const EdgeInsets.all(16), itemCount: fil.length, itemBuilder: (ctx, i) {
        final s = fil[i];
        return Container(margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]), child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [CircleAvatar(radius: 24, backgroundColor: stylistBg(s.avatarColor), child: Text(s.avatarInitials, style: TextStyle(color: stylistFg(s.avatarColor), fontWeight: FontWeight.w700, fontSize: 14))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(s.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))), if (s.partnered) Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(8)), child: const Row(children: [Icon(Icons.verified, color: kAmber, size: 10), SizedBox(width: 3), Text('Partner', style: TextStyle(color: kAmber, fontSize: 9, fontWeight: FontWeight.w700))]))]), Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.grey), Expanded(child: Text(s.address, style: const TextStyle(color: Colors.grey, fontSize: 11)))]), Row(children: [const Icon(Icons.star, size: 12, color: kGold), Text('${s.rating} (${s.reviews})', style: const TextStyle(color: Colors.grey, fontSize: 11))])]))]),
          const SizedBox(height: 10), Text(s.about, style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.4)), const SizedBox(height: 8),
          Wrap(spacing: 6, runSpacing: 4, children: s.tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)), child: Text(t, style: TextStyle(fontSize: 10, color: Colors.grey.shade700)))).toList()),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () { ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('Opening ${s.name}...'), backgroundColor: kPrimary)); }, icon: const Icon(Icons.storefront_outlined, size: 16), label: const Text('Visit Shop', style: TextStyle(fontSize: 13)), style: OutlinedButton.styleFrom(foregroundColor: kPrimary, side: const BorderSide(color: kPrimary), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 10)))),
        ])));
      })),
    ]),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, title: const Text('My Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), actions: [IconButton(icon: const Icon(Icons.logout, color: Colors.grey), onPressed: () { AppState.logout(); Navigator.pushAndRemoveUntil(c, MaterialPageRoute(builder: (_) => const AuthScreen()), (_) => false); })]),
    body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [CircleAvatar(radius: 36, backgroundColor: kPrimary, child: Text(AppState.userAvatar ?? 'U', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700))), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(AppState.userName ?? 'Guest', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)), const SizedBox(height: 2), Text(AppState.userEmail ?? '', style: const TextStyle(color: Colors.grey, fontSize: 13)), const SizedBox(height: 2), Row(children: [const Icon(Icons.phone_outlined, size: 12, color: Colors.grey), const SizedBox(width: 4), Text(AppState.userPhone ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(width: 10), const Icon(Icons.location_on_outlined, size: 12, color: Colors.grey), const SizedBox(width: 4), Text(AppState.userCity ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12))])]))])),
      const SizedBox(height: 16),
      Row(children: [_sc2('${AppState.orders.length}', 'Bookings', kPrimaryLight, kPrimaryDark), const SizedBox(width: 10), _sc2('${AppState.savedStylistIds.length}', 'Saved', kBlueLight, kBlue), const SizedBox(width: 10), _sc2('4.9', 'Avg Rating', kAmberLight, kAmber)]),
      const SizedBox(height: 20),
      const Text('Order History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
      if (AppState.orders.isEmpty) Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const Center(child: Text('No orders yet. Book your first stylist!', style: TextStyle(color: Colors.grey, fontSize: 13))))
      else ...AppState.orders.map((o) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [Container(width: 44, height: 44, decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.checkroom_outlined, color: kPrimaryDark, size: 22)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(o.stylistName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), Text('${o.service} · ${o.occasion}', style: const TextStyle(color: Colors.grey, fontSize: 11)), Text(o.date, style: const TextStyle(color: Colors.grey, fontSize: 11))])), Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Text('Rs ${o.amount}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: kPrimaryDark)), const SizedBox(height: 4), Row(children: List.generate(5, (i) => Icon(Icons.star, size: 10, color: i < o.rating ? kGold : Colors.grey.shade300))), const SizedBox(height: 4), kPill('Completed', kTealLight, kTeal)])]))),
      const SizedBox(height: 20),
      const Text('Quick Actions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
      _at(c, Icons.celebration_outlined, 'Wedding Planners', 'Find the perfect planner', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const PlannersPage()))),
      _at(c, Icons.brush_outlined, 'Stylists', 'Browse all stylists', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const StylistsPage()))),
      _at(c, Icons.people_outline, 'Influencers', 'Book a fashion influencer', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const InfluencersPage()))),
      _at(c, Icons.auto_awesome_outlined, 'Trending Looks', 'Get style inspiration', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const TrendingLooksScreen()))),
      _at(c, Icons.support_agent_outlined, 'Help & Support', 'Chat, FAQ, Email support', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const HelpCenterScreen()))),
      _at(c, Icons.dashboard_outlined, 'Stylist Dashboard', 'Manage your bookings', () => Navigator.push(c, MaterialPageRoute(builder: (_) => const StylistDashboardScreen()))),
      const SizedBox(height: 16),
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPrimaryMid)), child: Row(children: [const Icon(Icons.email_outlined, color: kPrimaryDark, size: 18), const SizedBox(width: 10), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Need help? Email us anytime', style: TextStyle(fontSize: 12, color: Colors.grey)), Text(kSupportEmail, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: kPrimaryDark))])])),
      const SizedBox(height: 20),
    ])),
  );

  static Widget _sc2(String n, String l, Color bg, Color fg) => Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 14), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)), child: Column(children: [Text(n, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: fg)), const SizedBox(height: 2), Text(l, style: const TextStyle(color: Colors.grey, fontSize: 11))])));
  static Widget _at(BuildContext c, IconData i, String t, String s, VoidCallback f) => GestureDetector(onTap: f, child: Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [Container(width: 40, height: 40, decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(10)), child: Icon(i, color: kPrimaryDark, size: 20)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), Text(s, style: const TextStyle(color: Colors.grey, fontSize: 11))])), const Icon(Icons.chevron_right, color: Colors.grey)])));
}

class BookingScreen extends StatefulWidget {
  final Stylist stylist;
  const BookingScreen({super.key, required this.stylist});
  @override State<BookingScreen> createState() => _BookingState();
}
class _BookingState extends State<BookingScreen> {
  int step = 0;
  String selO = '', selS = 'Clothing', pm = 'UPI', sb = 'SBI';
  double budget = 5000;
  DateTime? selDate;
  int numPersons = 1;
  final nc = TextEditingController(), pc = TextEditingController(), cc = TextEditingController(), prc = TextEditingController();
  final uc = TextEditingController(text: 'pay@upi'), kc = TextEditingController(), ec = TextEditingController(), vc = TextEditingController();
  final occ = ['Shaadi', 'Mehendi', 'Engagement', 'Birthday', 'Puja', 'Anniversary'];
  final srv = ['Clothing', 'Makeup', 'Jewellery', 'Full Package'];
  final bnks = ['SBI', 'HDFC', 'ICICI', 'Axis', 'PNB', 'Kotak'];
  int get total => widget.stylist.pricePerHour * 2 * numPersons;
  @override void initState() { super.initState(); nc.text = AppState.userName ?? ''; pc.text = AppState.userPhone ?? ''; cc.text = AppState.userCity ?? ''; }
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () { if (step == 1) setState(() => step = 0); else Navigator.pop(c); }), title: Text(step == 0 ? 'Book ${widget.stylist.name}' : 'Payment', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
    body: step == 0 ? _form(c) : _pay(c),
  );

  Widget _form(BuildContext c) => SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _s('Your Details'), _i('Full Name', nc, Icons.person_outline), const SizedBox(height: 10), _i('Phone', pc, Icons.phone_outlined, k: TextInputType.phone), const SizedBox(height: 10), _i('City', cc, Icons.location_on_outlined), const SizedBox(height: 20),
    _s('Select Occasion'),
    GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 3, childAspectRatio: 2.2, crossAxisSpacing: 8, mainAxisSpacing: 8, children: occ.map((o) { final sel = o == selO; return GestureDetector(onTap: () => setState(() => selO = o), child: Container(alignment: Alignment.center, decoration: BoxDecoration(color: sel ? kPrimaryLight : Colors.grey.shade50, borderRadius: BorderRadius.circular(10), border: Border.all(color: sel ? kPrimary : Colors.grey.shade200)), child: Text(o, style: TextStyle(fontSize: 12, fontWeight: sel ? FontWeight.w600 : FontWeight.normal, color: sel ? kPrimaryDark : Colors.grey.shade700)))); }).toList()),
    const SizedBox(height: 20), _s('Service Needed'),
    Wrap(spacing: 8, runSpacing: 8, children: srv.map((s) { final sel = s == selS; return GestureDetector(onTap: () => setState(() => selS = s), child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: sel ? kPrimary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: sel ? kPrimary : Colors.grey.shade300)), child: Text(s, style: TextStyle(color: sel ? Colors.white : Colors.grey.shade700, fontSize: 13)))); }).toList()),
    const SizedBox(height: 20), _s('Number of Persons'),
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('How many people need styling?', style: TextStyle(fontSize: 12, color: Colors.grey)), const SizedBox(height: 12),
      Row(children: [GestureDetector(onTap: () { if (numPersons > 1) setState(() => numPersons--); }, child: Container(width: 36, height: 36, decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.remove, color: kPrimaryDark, size: 20))), Expanded(child: Center(child: Text('$numPersons', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)))), GestureDetector(onTap: () { if (numPersons < 10) setState(() => numPersons++); }, child: Container(width: 36, height: 36, decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, color: kPrimaryDark, size: 20)))]),
      const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 4, children: List.generate(numPersons, (i) => Chip(backgroundColor: kPrimaryLight, label: Text('Person ${i + 1}', style: const TextStyle(color: kPrimaryDark, fontSize: 11)), avatar: const Icon(Icons.person, color: kPrimaryDark, size: 14), padding: EdgeInsets.zero, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap))),
      const SizedBox(height: 8),
      Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(8)), child: Row(children: [const Icon(Icons.calculate_outlined, color: kAmber, size: 16), const SizedBox(width: 8), Text('Estimated: Rs ${widget.stylist.pricePerHour * 2} x $numPersons = Rs $total', style: const TextStyle(color: kAmber, fontSize: 12, fontWeight: FontWeight.w600))])),
    ])),
    const SizedBox(height: 20), _s('Budget: Rs ${budget.toInt()}'),
    SliderTheme(data: SliderTheme.of(c).copyWith(activeTrackColor: kPrimary, thumbColor: kPrimary, inactiveTrackColor: kPrimaryMid), child: Slider(value: budget, min: 500, max: 20000, divisions: 39, onChanged: (v) => setState(() => budget = v))),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Rs 500', style: TextStyle(color: Colors.grey, fontSize: 11)), Text('Rs 20,000', style: TextStyle(color: Colors.grey, fontSize: 11))]),
    const SizedBox(height: 20), _s('Date & Time'),
    GestureDetector(onTap: () async { final d = await showDatePicker(context: c, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365))); if (d != null) setState(() => selDate = d); }, child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14), decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)), child: Row(children: [const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 18), const SizedBox(width: 10), Text(selDate == null ? 'Select date' : '${selDate!.day}/${selDate!.month}/${selDate!.year}', style: TextStyle(color: selDate == null ? Colors.grey : Colors.black))]))),
    const SizedBox(height: 16), _s('Special Preferences'),
    TextField(controller: prc, maxLines: 3, decoration: InputDecoration(hintText: 'Describe your dream look...', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)))),
    const SizedBox(height: 24),
    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => setState(() => step = 1), style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Proceed to Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))),
    const SizedBox(height: 20),
  ]));

  Widget _pay(BuildContext c) => SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPrimaryMid)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Booking Summary', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)), const SizedBox(height: 12), _r('Stylist', widget.stylist.name), _r('Service', selS), _r('Occasion', selO.isEmpty ? 'Not selected' : selO), _r('Date', selDate == null ? 'Not selected' : '${selDate!.day}/${selDate!.month}/${selDate!.year}'), _r('Duration', '2 hours'), _r('Persons', '$numPersons person${numPersons > 1 ? 's' : ''}'), const Divider(height: 16), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Total Amount', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)), Text('Rs $total', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: kPrimaryDark))])])),
    const SizedBox(height: 20), _s('Payment Method'),
    _po('UPI', Icons.account_balance_wallet_outlined), _po('Credit/Debit Card', Icons.credit_card), _po('Net Banking', Icons.account_balance_outlined),
    const SizedBox(height: 16),
    if (pm == 'UPI') ...[_s('UPI ID'), _i('UPI ID', uc, Icons.alternate_email)]
    else if (pm == 'Credit/Debit Card') ...[_s('Card Details'), _i('Card Number', kc, Icons.credit_card, k: TextInputType.number), const SizedBox(height: 10), Row(children: [Expanded(child: _i('MM/YY', ec, Icons.date_range)), const SizedBox(width: 10), Expanded(child: _i('CVV', vc, Icons.lock_outline, k: TextInputType.number))])]
    else ...[_s('Select Bank'), Container(padding: const EdgeInsets.symmetric(horizontal: 12), decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)), child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: sb, isExpanded: true, items: bnks.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(), onChanged: (v) => setState(() => sb = v!))))],
    const SizedBox(height: 24),
    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { AppState.orders.insert(0, OrderHistory(id: '#${100000 + Random().nextInt(900000)}', stylistName: widget.stylist.name, service: selS, occasion: selO.isEmpty ? 'General' : selO, date: 'Today', amount: total, status: 'Upcoming', rating: 0)); Navigator.pushReplacement(c, MaterialPageRoute(builder: (_) => ConfirmationScreen(stylist: widget.stylist, service: selS, date: selDate, total: total, numPersons: numPersons))); }, style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Pay & Confirm Booking', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))),
    const SizedBox(height: 12),
    const Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.lock_outline, size: 14, color: Colors.grey), SizedBox(width: 4), Text('100% Secure Payment', style: TextStyle(color: Colors.grey, fontSize: 12))])),
    const SizedBox(height: 20),
  ]));

  Widget _po(String l, IconData i) { final sel = pm == l; return GestureDetector(onTap: () => setState(() => pm = l), child: Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12), decoration: BoxDecoration(color: sel ? kPrimaryLight : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: sel ? kPrimary : Colors.grey.shade300)), child: Row(children: [Icon(i, color: sel ? kPrimary : Colors.grey, size: 20), const SizedBox(width: 12), Text(l, style: TextStyle(fontWeight: sel ? FontWeight.w600 : FontWeight.normal, color: sel ? kPrimaryDark : Colors.black)), const Spacer(), if (sel) const Icon(Icons.check_circle, color: kPrimary, size: 20)]))); }
  Widget _r(String l, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l, style: const TextStyle(color: Colors.grey, fontSize: 13)), Text(v, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13))]));
  Widget _s(String t) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(t, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)));
  Widget _i(String h, TextEditingController c, IconData i, {TextInputType k = TextInputType.text}) => TextField(controller: c, keyboardType: k, decoration: InputDecoration(hintText: h, hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), prefixIcon: Icon(i, color: Colors.grey, size: 18), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)));
}

class ConfirmationScreen extends StatefulWidget {
  final Stylist stylist;
  final String service;
  final DateTime? date;
  final int total, numPersons;
  const ConfirmationScreen({super.key, required this.stylist, required this.service, this.date, required this.total, this.numPersons = 1});
  @override State<ConfirmationScreen> createState() => _ConfState();
}
class _ConfState extends State<ConfirmationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _a;
  final id = (100000 + Random().nextInt(900000)).toString();
  @override void initState() { super.initState(); _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 700)); _a = CurvedAnimation(parent: _c, curve: Curves.elasticOut); _c.forward(); }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ScaleTransition(scale: _a, child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: kTealLight, shape: BoxShape.circle), child: const Icon(Icons.check_rounded, color: kTeal, size: 56))),
      const SizedBox(height: 24), const Text('Booking Confirmed!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)), const SizedBox(height: 8), const Text('Your stylist is ready for you!', style: TextStyle(color: Colors.grey, fontSize: 15)), const SizedBox(height: 28),
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(16), border: Border.all(color: kPrimaryMid)), child: Column(children: [_rw('Stylist', widget.stylist.name), _rw('Service', widget.service), _rw('Date', widget.date == null ? 'Not set' : '${widget.date!.day}/${widget.date!.month}/${widget.date!.year}'), _rw('Persons', '${widget.numPersons} person${widget.numPersons > 1 ? 's' : ''}'), _rw('Amount Paid', 'Rs ${widget.total}'), const Divider(height: 20), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Booking ID', style: TextStyle(color: Colors.grey, fontSize: 13)), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: kPrimary, borderRadius: BorderRadius.circular(8)), child: Text('#$id', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)))])])),
      const SizedBox(height: 16),
      Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: kAmberLight, borderRadius: BorderRadius.circular(10)), child: const Row(children: [Icon(Icons.notifications_outlined, color: kAmber, size: 18), SizedBox(width: 10), Expanded(child: Text('Your stylist will contact you 1 hour before your appointment.', style: TextStyle(color: kAmber, fontSize: 12, height: 1.4)))])),
      const SizedBox(height: 28),
      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pushAndRemoveUntil(c, MaterialPageRoute(builder: (_) => const MainNav()), (_) => false), style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Back to Home', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)))),
    ]))),
  );
  Widget _rw(String l, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l, style: const TextStyle(color: Colors.grey, fontSize: 13)), Text(v, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))]));
}

class StylistDashboardScreen extends StatefulWidget {
  const StylistDashboardScreen({super.key});
  @override State<StylistDashboardScreen> createState() => _DashState();
}
class _DashState extends State<StylistDashboardScreen> {
  bool live = true;
  String sm = 'April';
  final months = ['January', 'February', 'March', 'April'];
  final earn = [8400, 11200, 9600, 14400];
  final lbls = ['Jan', 'Feb', 'Mar', 'Apr'];
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: const Color(0xFFF8F8F8),
    appBar: AppBar(backgroundColor: Colors.white, elevation: 0.5, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(c)), title: const Text('Stylist Dashboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), actions: [Padding(padding: const EdgeInsets.only(right: 12), child: Row(children: [Text(live ? 'Live' : 'Offline', style: TextStyle(color: live ? kTeal : Colors.grey, fontSize: 13, fontWeight: FontWeight.w600)), const SizedBox(width: 4), Switch(value: live, onChanged: (v) => setState(() => live = v), activeColor: kPrimary, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)]))]),
    body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [_sc('Rs 14,400', 'This Month', kTealLight, kTeal), const SizedBox(width: 10), _sc('12', 'Bookings', kPrimaryLight, kPrimaryDark), const SizedBox(width: 10), _sc('4.9★', 'Rating', kAmberLight, kAmber)]),
      const SizedBox(height: 20), _chart(), const SizedBox(height: 20), _table(), const SizedBox(height: 20), _summary(), const SizedBox(height: 20), _avail(), const SizedBox(height: 20),
    ])),
  );

  Widget _sc(String n, String l, Color bg, Color fg) => Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)), child: Column(children: [Text(n, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: fg)), const SizedBox(height: 4), Text(l, style: const TextStyle(color: Colors.grey, fontSize: 11))])));

  Widget _chart() {
    final mx = earn.reduce((a, b) => a > b ? a : b).toDouble();
    return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Monthly Earnings', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)), child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: sm, isDense: true, items: months.map((m) => DropdownMenuItem(value: m, child: Text(m, style: const TextStyle(fontSize: 12)))).toList(), onChanged: (v) => setState(() => sm = v!))))]),
      const SizedBox(height: 20),
      SizedBox(height: 130, child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(earn.length, (i) { final h = mx > 0 ? (earn[i] / mx * 110) : 0.0; final s = lbls[i] == 'Apr'; return Column(mainAxisAlignment: MainAxisAlignment.end, children: [Text('Rs ${(earn[i] / 1000).toStringAsFixed(1)}k', style: const TextStyle(fontSize: 9, color: Colors.grey)), const SizedBox(height: 4), AnimatedContainer(duration: const Duration(milliseconds: 600), width: 36, height: h, decoration: BoxDecoration(color: s ? kPrimary : kPrimaryMid, borderRadius: BorderRadius.circular(6))), const SizedBox(height: 6), Text(lbls[i], style: const TextStyle(fontSize: 11, color: Colors.grey))]); }))),
    ]));
  }

  Widget _table() => Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12), child: Text('Bookings', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
    ...mockBookings.map((b) { Color bg, fg; if (b.status == 'Completed') { bg = kTealLight; fg = kTeal; } else if (b.status == 'Upcoming') { bg = kBlueLight; fg = kBlue; } else { bg = Colors.grey.shade100; fg = Colors.grey.shade600; } return Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100))), child: Row(children: [Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(b.clientName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), Text(b.occasion, style: const TextStyle(fontSize: 11, color: Colors.grey))])), Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(b.date, style: const TextStyle(fontSize: 11, color: Colors.grey)), Text('${b.hours}h · Rs ${b.amount}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))])), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)), child: Text(b.status, style: TextStyle(color: fg, fontSize: 10, fontWeight: FontWeight.w600)))])); }),
  ]));

  Widget _summary() => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPrimaryMid)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_si('13.5h', 'Hours'), _si('6', 'Clients'), _si('Rs 14,400', 'Earned')]));
  Widget _si(String v, String l) => Column(children: [Text(v, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: kPrimaryDark)), const SizedBox(height: 3), Text(l, style: const TextStyle(fontSize: 11, color: Colors.grey))]);

  Widget _avail() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final av = [true, true, false, true, true, true, false];
    return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('My Availability', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), const SizedBox(height: 14), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(7, (i) => Container(width: 36, height: 36, decoration: BoxDecoration(color: av[i] ? kPrimary : Colors.grey.shade100, shape: BoxShape.circle), alignment: Alignment.center, child: Text(days[i], style: TextStyle(color: av[i] ? Colors.white : Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)))))]));
  }
}
