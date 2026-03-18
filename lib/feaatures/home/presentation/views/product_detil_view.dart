import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';

class ProductDetailsView extends StatefulWidget {
  static const id = "ProductDetailsView";
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 4;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! ProductModel) {
      return const Scaffold(
        body: Center(
          child: Text("لم يتم استلام بيانات المنتج"),
        ),
      );
    }

    final ProductModel data = args;

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildTopSection(imageUrl: data.imageUrl),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildTitleAndPrice(
                        price: data.price,
                        productName: data.name,
                      ),
                      const SizedBox(height: 14),
                      _buildRatingRow(),
                      const SizedBox(height: 14),
                      _buildDescription(desc: data.description),
                      const SizedBox(height: 18),
                      _buildInfoGrid(
                        isOrganic: data.isOrganic,
                        cal: data.numberOfCalories,
                      ),
                      const SizedBox(height: 24),
                      _buildAddToCartButton(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection({required String imageUrl}) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffF1F3F4),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(300, 80),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 16,
            child: Row(
              children: [
                _circleButton(
                  icon: Icons.remove,
                  backgroundColor: const Color(0xffF1F1F1),
                  iconColor: const Color(0xff8E8E8E),
                  onTap: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 12),
                _circleButton(
                  icon: Icons.add,
                  backgroundColor: const Color(0xff0B7A3E),
                  iconColor: Colors.white,
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 55,
            child: Center(
              child: CachedNetworkImage(
                imageUrl:
                    "https://hchbtxlqvtmswhthhsev.supabase.co/storage/v1/object/public/$imageUrl",
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                placeholder: (context, url) => const SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  width: 200,
                  height: 200,
                  child: Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndPrice({
    required num price,
    required String productName,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            productName,
            textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'دينار $price / الكيلو',
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xffF4A91F),
            fontSize: 15,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: const [
        Icon(
          Icons.star_rounded,
          color: Color(0xffF4C542),
          size: 20,
        ),
        SizedBox(width: 4),
        Text(
          '4.5',
          style: TextStyle(
            color: Color(0xff4E5556),
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 6),
        Text(
          '(30+)',
          style: TextStyle(
            color: Color(0xffA0A0A0),
            fontSize: 12,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          'المراجعات',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Color(0xff0B7A3E),
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xff0B7A3E),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription({required String desc}) {
    return Text(
      desc,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      style: const TextStyle(
        color: Color(0xff8B8B8B),
        fontSize: 13,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w600,
        height: 1.8,
      ),
    );
  }

  Widget _buildInfoGrid({required bool isOrganic, required num cal}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InfoCard(
                icon: Icons.eco_rounded,
                iconColor: const Color(0xff0B7A3E),
                title: isOrganic ? "نعم" : "لا",
                subtitle: 'أورجانيك',
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: InfoCard(
                icon: Icons.scale_rounded,
                iconColor: Color(0xff0B7A3E),
                title: '1 كغم',
                subtitle: 'الوزن',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: InfoCard(
                icon: Icons.star_rounded,
                iconColor: Color(0xffF4A91F),
                title: '4.8',
                subtitle: 'Reviews',
                trailingText: '(256)',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: InfoCard(
                icon: Icons.local_fire_department_rounded,
                iconColor: Color(0xffFF7A00),
                title: '$cal كالوري',
                subtitle: '100 جرام',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0B7A3E),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'أضف إلى السلة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? trailingText;

  const InfoCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFCFCFC),
        border: Border.all(color: const Color(0xffECECEC)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: const TextStyle(
                    color: Color(0xffB4B4B4),
                    fontSize: 11,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              const Spacer(),
              Icon(icon, color: iconColor, size: 22),
            ],
          ),
          const Spacer(),
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Color(0xff0B7A3E),
              fontSize: 15,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Color(0xff9A9A9A),
              fontSize: 12,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
