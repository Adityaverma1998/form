import 'package:basic_form/presentation/blocs/add_form_data_bloc.dart';
import 'package:basic_form/presentation/model/common_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddFormBloc, AddFormDataState>(
          builder: (context, state) {
            if (state is AddFormDataInitialState) {
              context.read<AddFormBloc>().add(LoadInitialDataEvent());
              return Center(child: CircularProgressIndicator());
            }

            if (state is AddFormDataLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is StateAndDistrictsLoaded) {
              print("call me ");
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// State Dropdown
                    DropdownButtonFormField<CommonResponse>(
                      value: state.selectedState,
                      hint: Text('Select State'),
                      items: state.states.map((stateItem) {
                        return DropdownMenuItem<CommonResponse>(
                          value: stateItem,
                          child: Text(stateItem.title ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<AddFormBloc>().add(SelectStateEvent(value));
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'State',
                      ),
                    ),
                    SizedBox(height: 16),

                    /// District Dropdown
                    DropdownButtonFormField<CommonResponse>(
                      value: state.selectedDistrict,
                      hint: Text('Select District'),
                      items: state.districts.map((district) {
                        return DropdownMenuItem<CommonResponse>(
                          value: district,
                          child: Text(district.title ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<AddFormBloc>().add(SelectDistrictEvent(value));
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'District',
                      ),
                    ),
                    SizedBox(height: 16),

                    /// Gender Radio Buttons
                    Text('Select Gender'),
                    ...state.genders.map((gender) {
                      return RadioListTile<CommonResponse>(
                        title: Text(gender.title ?? ''),
                        value: gender,
                        groupValue: state.selectedGender,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<AddFormBloc>().add(SelectGenderEvent(value));
                          }
                        },
                      );
                    }).toList(),

                    SizedBox(height: 16),

                    /// Subjects Checkboxes
                    Text('Select Subjects'),
                    ...state.courses.map((subject) {
                      final isSelected = state.selectedSubjects.contains(subject);
                      return CheckboxListTile(
                        title: Text(subject.title ?? ''),
                        value: isSelected,
                        onChanged: (checked) {
                          final updatedSubjects = List<CommonResponse>.from(state.selectedSubjects);
                          if (checked == true) {
                            updatedSubjects.add(subject);
                          } else {
                            updatedSubjects.removeWhere((s) => s.id == subject.id);
                          }
                          context.read<AddFormBloc>().add(SelectSubjectsEvent(updatedSubjects));
                        },
                      );
                    }).toList(),

                  ],
                ),
              );
            }

            if (state is AddFormDataError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return Center(child: Text('Initializing...'));
          },
        ),
      ),
    );
  }
}
