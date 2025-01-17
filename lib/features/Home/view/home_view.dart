import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/main.dart';
import '../../../core/components/component.dart';
import '../view_models/bloc/home_bloc_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // final dateFormat = DateFormat(DateFormat.HOUR24_MINUTE);
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state is HomeBlocInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            final homeModel = state.homeModel;

            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              top: 1.h,
                              child: Image.asset(homeModel.coverImage)),
                          // Custom Paint for blending effect
                          CustomPaint(
                            size: MediaQuery.of(context).size,
                            painter: BlendPainter(),
                          ),
                          Positioned(
                              top: 80.h,
                              // left: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                          text: homeModel.location,
                                          shadow: const [
                                            Shadow(
                                                color: AppColor.purpleAccent1,
                                                offset: Offset(1.5, 2))
                                          ],
                                          weight: FontWeight.w700,
                                          size: 34.sp,
                                          color: AppColor.purpleAccent),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0).r,
                                        child: SvgPicture.asset(
                                          AppIcon.dropdown,
                                          height: 10.h,
                                          width: 8.w,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 130.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcon.timer,
                                                height: 15.h,
                                                width: 13.w,
                                              ),
                                              AppText(
                                                text: ' 22h 00m',
                                                color: AppColor.white100,
                                                size: 16.sp,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcon.user1,
                                                height: 15.h,
                                                width: 13.w,
                                                // color: AppColor.white100,
                                              ),
                                              AppText(
                                                text: " ${homeModel.views}",
                                                color: AppColor.white100,
                                                size: 16.sp,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).r,
                      child: Column(
                        children: [
                          SizedBox(
                            // height: MediaQuery.sizeOf(context).height * .37,
                            width: double.maxFinite,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 8 / 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.homeModel.answers.length,
                              itemBuilder: (context, index) {
                                final isSelected = state.selectedIndex == index;

                                final answers = state.homeModel.answers[index];
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(SelectTileEvent(index: index));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.grey,
                                      border: Border.all(
                                          color: isSelected
                                              ? AppColor.purpleAccent2
                                              : Colors.transparent),
                                      borderRadius: const BorderRadius.all(
                                              Radius.circular(12))
                                          .r,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                                  horizontal: 4)
                                              .r,
                                          child: Container(
                                            height: 30.w,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColor.purpleAccent2
                                                  : Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: isSelected
                                                      ? AppColor.purpleAccent2
                                                      : AppColor.white100),
                                            ),
                                            child: Center(
                                              child: AppText(
                                                text: answers.options,
                                                color: AppColor.white100,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  .32.w,
                                          child: AppText(
                                            text: answers.answers,
                                            size: 14.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10).r,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * .6.w,
                                  child: AppText(
                                      color: Colors.white,
                                      size: 14.sp,
                                      weight: FontWeight.w400,
                                      text:
                                          '''Pick your option. \nSee who has a similar mind.'''),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                SvgPicture.asset(
                                  AppIcon.mic,
                                  height: 48.w,
                                  width: 48.h,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                SvgPicture.asset(
                                  AppIcon.forwardButton,
                                  height: 48.h,
                                  width: 48.w,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.527.r,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10)
                          .r,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    height: 100.h,
                                    width: 100.w,
                                    homeModel.profilePicture,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                        text: homeModel.name,
                                        size: 12.sp,
                                        weight: FontWeight.w700,
                                      ),
                                      AppText(
                                        text: ", ${homeModel.age}",
                                        size: 12.sp,
                                        weight: FontWeight.w700,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0).r,
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          .64.w,
                                      child: AppText(
                                        text: homeModel.pQuestion,
                                        size: 20.sp,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText(
                            text: '''"${homeModel.answer}"''',
                            size: 12.sp,
                            weight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: AppColor.purpleAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 600.w),
            child: BlocSelector<HomeBloc, HomeBlocState, int>(
              selector: (state) => (state is HomeLoadedState)
                  ? state.currentIndex
                  : 0, // Select only currentIndex
              builder: (context, currentIndex) {
                int chatLength = 2;
                int notiff = 5;
                return BottomNavigationBar(
                    backgroundColor: const Color(0x00000000),
                    unselectedFontSize: 0,
                    selectedFontSize: 0,
                    elevation: 20.r,
                    landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
                    onTap: (index) {
                      if (index != currentIndex) {
                        context
                            .read<HomeBloc>()
                            .add(UpdateIndexEvent(index: index));

                        HapticFeedback.lightImpact();
                      }
                    },
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: currentIndex,
                    items: List.from(narBarItems.map(
                      (e) => BottomNavigationBarItem(
                        backgroundColor: const Color(0x00000000),
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            e.text == 'chat' || e.text == 'bonfire'
                                ? chatLength == 0 || notiff == 0
                                    ? SvgPicture.asset(
                                        e.icon,
                                      )
                                    : Badge.count(
                                        backgroundColor: AppColor.purpleAccent2,
                                        count: e.text == 'chat'
                                            ? chatLength
                                            : notiff,
                                        child: SvgPicture.asset(
                                          e.icon,
                                        ),
                                      )
                                : SvgPicture.asset(
                                    e.icon,
                                  ),
                            Container(
                              width: 4.w,
                              height: 4.h,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                        label: ' ',
                        activeIcon: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            e.text == 'chat' || e.text == 'bonfire'
                                ? chatLength == 0 || notiff == 0
                                    ? SvgPicture.asset(
                                        e.iconActive,
                                      )
                                    : Badge.count(
                                        backgroundColor: AppColor.purpleAccent2,
                                        count: e.text == 'chat'
                                            ? chatLength
                                            : notiff,
                                        child: SvgPicture.asset(
                                          e.icon,
                                          color: AppColor.purpleAccent2,
                                        ),
                                      )
                                : SvgPicture.asset(
                                    e.iconActive,
                                    color: AppColor.purpleAccent2,
                                  ),
                            Container(
                              width: 4.w,
                              height: 4.h,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
