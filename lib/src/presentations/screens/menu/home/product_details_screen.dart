import 'package:aucsy/src/domain/models/product_model.dart';
import 'package:aucsy/src/presentations/widgets/buttons/leading_back.dart';
import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:aucsy/src/presentations/widgets/containers/due_time_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import '../../../../theme/app_theme.dart';
import '../../../widgets/texts/main_title.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with SingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Info'),
    const Tab(text: 'Owner'),
    const Tab(text: 'History'),
    const Tab(text: 'Statistics'),
  ];

  late TabController _tabController;

  int _index = 0;
  late bool _isUpcoming;
  bool _isSaved = false;

  LinearGradient usernameGradient = const LinearGradient(
    colors: [
      Color(0xFFBAC1FF),
      Color(0xFF63FEFE),
      Color(0xFFFF3EEC),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  void initState() {
    if (widget.product.time.isAfter(DateTime.now())) {
      setState(() {
        _isUpcoming = true;
      });
    } else {
      setState(() {
        _isUpcoming = false;
      });
    }
    _tabController = TabController(vsync: this, length: myTabs.length);
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  bool _showDarkAppBar = true;

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      _showDarkAppBar = _scrollController.offset <= kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppTheme.bg,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.red.withOpacity(0.4),
                AppTheme.blue.withOpacity(0.1),
                // Colors.transparent,
                // Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                AppTheme.red.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor:
                  _showDarkAppBar ? Colors.transparent : AppTheme.dark,
              elevation: 0,
              leadingWidth: 60,
              centerTitle: true,
              leading: const LeadingBack(),
              title: const MainTitle(text: "Details"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 2,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/more.svg',
                          // height: 24,
                          // width: 24,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 272,
                      width: MediaQuery.of(context).size.width - 48,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 252,
                            width: MediaQuery.of(context).size.width - 48,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                              ),
                              child: Hero(
                                tag: widget.product,
                                child: Image.asset(
                                  widget.product.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isSaved = !_isSaved;
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(40),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppTheme.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          _isSaved == false
                                              ? 'assets/icons/save.svg'
                                              : 'assets/icons/saved.svg',
                                          color: _isSaved == false
                                              ? AppTheme.black
                                              : AppTheme.red,
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.white,
                              height: 1.4,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.dark,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.asset(
                              widget.product.creator.avatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Creator',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.gray,
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return usernameGradient.createShader(bounds);
                              },
                              child: Text(
                                "@${widget.product.creator.username}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.fontFamily,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.white,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.text,
                            style: const TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppTheme.gray,
                              letterSpacing: 0.2,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width - 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(48),
                        border: Border.all(
                          color: AppTheme.gray.withOpacity(0.5),
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: AppTheme.white,
                        unselectedLabelColor: AppTheme.gray,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 12,
                          color: AppTheme.white,
                        ),
                        splashBorderRadius: BorderRadius.circular(32),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: AppTheme.blue,
                        ),
                        padding: const EdgeInsets.all(8),
                        tabs: myTabs,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Text('1'),
                          ListView.builder(
                            itemCount: 40,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                            return Text('2');
                          }),
                          Text('3'),
                          Text('4'),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: AppTheme.black.withOpacity(0.35),
                      padding: EdgeInsets.only(
                        top: 12,
                        left: 24,
                        right: 24,
                        bottom: Platform.isIOS ? 32 : 24,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Highest Bid',
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.gray,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${widget.product.currentBid.price} USD',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppTheme.fontFamily,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.white,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _isUpcoming
                                        ? 'Auction starts in:'
                                        : "Auction Time",
                                    style: const TextStyle(
                                      fontFamily: AppTheme.fontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.gray,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  DueTimeText(
                                    endTime: widget.product.time,
                                    textSize: 16,
                                    onTimeChanged: (time) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          MainButton(
                            text: "Place bid",
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
