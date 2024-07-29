import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../warehouse_home/category_warehouse/data/models/all_request_category_model.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/accept_request_cubit/accept_request_cubit.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/accept_request_cubit/accept_request_state.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/reject_request_cubit/reject_request_cubit.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/reject_request_cubit/reject_request_state.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/request_category_cubit/request_category_cubit.dart';

class RequestCategoryDetailsViewBody extends StatelessWidget {
  const RequestCategoryDetailsViewBody({Key? key, required this.allRequestCategory}) : super(key: key);

  final DataRequestCategory allRequestCategory;

  @override
  Widget build(BuildContext context) {
    AcceptRequestCubit cubit = AcceptRequestCubit.get(context);
    RejectRequestCubit cubitReject = RejectRequestCubit.get(context);
    return BlocConsumer<AcceptRequestCubit, AcceptRequestState>(
      listener: (context, state) {
        if (state is AcceptRequestSuccess) {
          context.read<RequestCategoryCubit>().fetchRequestCategories();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Accept successfully")),
          );
        } else if (state is AcceptRequestFailure) {
          context.read<RequestCategoryCubit>().fetchRequestCategories();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Accept failed")),
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<RejectRequestCubit, RejectRequestState>(
          listener: (contextReject, stateReject) {
            if (stateReject is AcceptRequestSuccess) {
              contextReject.read<RequestCategoryCubit>().fetchRequestCategories();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Reject successfully")),
              );
            } else if (stateReject is AcceptRequestFailure) {
              contextReject.read<RequestCategoryCubit>().fetchRequestCategories();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Reject failed")),
              );
            }
          },
          builder: (contextReject, stateReject) {
            return Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.fetchAcceptRequest(id: allRequestCategory.id);
                          },
                          child: Container(
                            height: 35.0,
                            width: MediaQuery.of(context).size.width * 0.08,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)),
                              color: Colors.green,
                            ),
                            child: state is AcceptRequestLoading ? const Center(child: CircularProgressIndicator(color: ColorManager.blue,),)
                                : const Center(
                              child: Text(
                                'Approve',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSize.s16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                        GestureDetector(
                          onTap: () {
                            cubitReject.fetchRejectRequest(id: allRequestCategory.id);
                          },
                          child: Container(
                            height: 35.0,
                            width: MediaQuery.of(context).size.width * 0.08,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(Radius.circular(8.0)),
                              color: Colors.red,
                            ),
                            child: stateReject is RejectRequestLoading ? const Center(child: CircularProgressIndicator(color: ColorManager.blue,),)
                                : const Center(
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSize.s16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s16,),
                      child: Material(
                        borderRadius: const BorderRadiusDirectional.all(Radius.circular(10.0)),
                        color: Colors.grey.shade100,
                        elevation: 2.0,
                        child: SizedBox(
                          height: 300.0,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(AppSize.s16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.feed,
                                      color: ColorManager.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16,),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Category name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            allRequestCategory.status,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      color: ColorManager.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16,),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Created at",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            allRequestCategory.createdAt.replaceRange(10, 27, ''),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.edit_calendar_outlined,
                                      color: ColorManager.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16,),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Last Updated",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            allRequestCategory.updatedAt.replaceRange(10, 27, ''),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.assignment,
                                      color: ColorManager.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16,),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Request status",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            allRequestCategory.status,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );  }
}
