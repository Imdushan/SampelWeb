<template>
  <div>
      <v-container>
        <v-row>
          <!-- <v-col cols="12" md="12">
            <center>
            <img
            size="12"
            src="/images/main_logo.jpg"
            class="mt-1 mr-2"
            style="width: 25%; height: 150px"
          />
            </center>
          </v-col> -->
        </v-row>
        <v-row>
          <v-col cols="12" md="3">
            <v-card elevation="5" class="pa-5" color="#2196f35e">
               Total Farmer <v-chip color="blue" class="white--text">{{totalFarmers}}</v-chip>
            </v-card>
          </v-col>
          <v-col cols="12" md="3">
            <v-card elevation="5" class="pa-5" color="#ff98005e">
               Pending Farmer <v-chip color="orange" class="white--text">{{pendingFarmers}}</v-chip>
            </v-card>
          </v-col>
          <v-col cols="12" md="3">
            <v-card elevation="5" class="pa-5" color="#f4433663">
               Rejected Farmer <v-chip color="red" class="white--text">{{rejectedFarmers}}</v-chip>
            </v-card>
          </v-col>
          <v-col cols="12" md="3">
            <v-card elevation="5" class="pa-5" color="#4caf505e">
               Approved Farmer <v-chip color="green" class="white--text">{{verifiedFarmers}}</v-chip>
            </v-card>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6">
            <v-card elevation="5">
              <h3 class="text-center">ASC wise Farmer Count</h3>
            <div id="chartdivAS1" style="height: 360px;"></div>
            </v-card>

          </v-col>
          <v-col cols="12" md="6">
            <v-card elevation="5">
              <h3 class="text-center">AF wise Farmer Count</h3>
            <div id="chartdivAS2" style="height: 360px;"></div>
            </v-card>

          </v-col>
          <v-col cols="12" md="12">
            <v-card elevation="5">
              <h3 class="text-center">ASC wise Producer Societies</h3>
            <div id="chartdivAS3" style="height: 360px;"></div>
            </v-card>

          </v-col>
        </v-row>
        <v-snackbar v-model="snackbar" :multi-line="false" :color="snackColor">{{ snackMessage }}</v-snackbar>
      </v-container>

        <v-dialog
        v-model="openFarmerEditDialog"
        persistent
        max-width="800px"
        >
        <v-card>
            <v-card-title>
            <span class="text-h5">Farmer Update Form</span>
            </v-card-title>
            <v-card-text>
            <v-container>
                <v-row>
                <v-col
                    cols="12"
                    sm="6"
                    md="4"
                >
                    <v-text-field
                    label="Name"
                    v-model="editName"
                    required
                    ></v-text-field>
                </v-col>
                <v-col
                    cols="12"
                    sm="6"
                    md="4"
                >
                    <v-text-field
                    label="NIC"
                    v-model="editNIC"
                    required
                    ></v-text-field>
                </v-col>
                <v-col
                    cols="12"
                    sm="6"
                    md="4"
                >
                    <v-select
                    :items="['male', 'female']"
                    v-model="editGender"
                    label="Gender"
                    required
                    ></v-select>
                </v-col>

                <v-col
                    cols="12"
                    sm="6"
                >
                    <v-text-field
                    label="Mobile"
                    v-model="editMobile"
                    required
                    ></v-text-field>
                </v-col>
                <v-col
                    cols="12"
                    sm="6"
                    md="6"
                >
                    <v-select
                    :items="['married', 'unmarried']"
                    v-model="editCivilStatus"
                    label="Civil Status"
                    required
                    ></v-select>
                </v-col>
                </v-row>
            </v-container>
            </v-card-text>
            <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
                color="blue darken-1"
                text
                @click="openFarmerEditDialog = false"
            >
                Close
            </v-btn>
            <v-btn
            :loading="registrationLoading"
                color="blue darken-1"
                text
                @click="editFarmerDetails()"
            >
                Save
            </v-btn>
            </v-card-actions>
        </v-card>
        </v-dialog>

  </div>
</template>

<script>
import * as XLSX from "xlsx";
import {XlsxRead, XlsxTable, XlsxSheets, XlsxJson, XlsxWorkbook, XlsxSheet, XlsxDownload } from "vue-xlsx/dist/vue-xlsx.es.js";
import * as am4core from "@amcharts/amcharts4/core";
import * as am4charts from "@amcharts/amcharts4/charts";
import am4themes_animated from "@amcharts/amcharts4/themes/animated";
import am4themes_kelly from "@amcharts/amcharts4/themes/kelly";
am4core.useTheme(am4themes_animated);
am4core.useTheme(am4themes_kelly);
export default {
  name: "DashboardView",

  components:{
      XlsxRead,
        XlsxTable,
        XlsxSheets,
        XlsxJson,
        XlsxWorkbook,
        XlsxSheet,
        XlsxDownload
  },

  data: () => ({
    totalFarmers:"",
    verifiedFarmers:"",
    pendingFarmers:"",
    rejectedFarmers:"",
    farmerExcelSheet:null,
    selectedSheet: null,
    farmerDatasetFromExcel:[],
    isUploadCorrectExcelSheet:false,
    dialog: false,
    dialogFarmerBulkRegistration:false,
    getAllDetailsLoading:false,
    moreFarmerDetails:{},
    moreInfoDialog:false,
    snackbar: false,
      snackColor: "",
      snackMessage: "",
      dialogDelete: false,
      headers: [
        {
          text: 'Name',
          align: 'start',
          sortable: false,
          value: 'name',
        },
        { text: 'NIC', value: 'nic' },
        { text: 'Gender', value: 'gender' },
        { text: 'Actions', value: 'actions', sortable: false },
      ],
      instituteBranchMultipleVal:[
        {
          branchName: "",
          branchDistrict: ""
        }
      ],
      afDistrict:"",
      afPassword:"",
      afEmail:"",
      afMobile:"",
      afName:"",
      registrationLoading:false,
      subInstituteDetails:[],
      districtName: [
        'Ampara',
        'Anuradhapura',
        'Badulla',
        'Batticaloa',
        'Colombo',
        'Galle',
        'Gampaha',
        'Hambantota',
        'Jaffna',
        'Kalutara',
        'Kandy',
        'Kegalle',
        'Kilinochchi',
        'Kurunegala',
        'Mannar',
        'Matale',
        'Matara',
        'Monaragala',
        'Mullaitivu',
        'Nuwara Eliya',
        'Polonnaruwa',
        'Puttalam',
        'Ratnapura',
        'Trincomalee',
        'Vavuniya'
      ],
      selectedDPDEditValues:{},
      openFarmerEditDialog:false,
      desserts: [],
      FarmerDetails:[],
      editGender:"",
      editCivilStatus:"",
      editMobile:"",
      editName:"",
      editNIC:"",
      editUserId:"",
      deleteUserId:"",
      deleteUserDetails:"",
      openFarmerDeleteDialog:false,
      editedIndex: -1,
      editedItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
      defaultItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
  }),
  mounted(){
    //this.dashboardStatisticsDataPreview();
    this.mountASCwiseFarmers();
    this.mountASCwiseProducerSocieties();
    this.mountAFwiseFarmers();
  },
  methods: {
    isLogOut() {
      window.setLogout();
    },

    mountASCwiseFarmers(){
      // Create chart instance
        var chart = am4core.create("chartdivAS1", am4charts.PieChart);

        chart.data = [{
        "asc": "Yodakandiya",
        "farmerCount": 250
      }, {
        "asc": "Weeravila",
        "farmerCount": 222
      }, {
        "asc": "Badagiriya",
        "farmerCount": 170
      }, {
        "asc": "Ambalantota",
        "farmerCount": 122
      }, {
        "asc": "Lunama",
        "farmerCount": 99
      }, {
        "asc": "Agunukolapelesse",
        "farmerCount": 85
      }, {
        "asc": "Beliaththa",
        "farmerCount": 93
      }, {
        "asc": "Walasmulla",
        "farmerCount": 50
      }, {
        "asc": "Weerakatiya",
        "farmerCount": 42
      }];

        // Add and configure Series
        var pieSeries = chart.series.push(new am4charts.PieSeries());
        pieSeries.dataFields.value = "farmerCount";
        pieSeries.dataFields.category = "asc";

        // Let's cut a hole in our Pie chart the size of 40% the radius
        chart.innerRadius = am4core.percent(40);

        // Put a thick white border around each Slice
        pieSeries.slices.template.stroke = am4core.color("#4a2abb");
        pieSeries.slices.template.strokeWidth = 2;
        pieSeries.slices.template.strokeOpacity = 1;


        // Add a legend
        // chart.legend = new am4charts.Legend();
        // chart.legend.fontSize = 9;
        chart.fontSize = 10;
    },

    mountASCwiseProducerSocieties(){
        var chart = am4core.create("chartdivAS3", am4charts.XYChart3D);

      // Add data
      chart.data = [{
        "asc": "Yodakandiya",
        "farmerCount": 250
      }, {
        "asc": "Weeravila",
        "farmerCount": 222
      }, {
        "asc": "Badagiriya",
        "farmerCount": 170
      }, {
        "asc": "Ambalantota",
        "farmerCount": 122
      }, {
        "asc": "Lunama",
        "farmerCount": 99
      }, {
        "asc": "Agunukolapelesse",
        "farmerCount": 85
      }, {
        "asc": "Beliaththa",
        "farmerCount": 93
      }, {
        "asc": "Walasmulla",
        "farmerCount": 50
      }, {
        "asc": "Weerakatiya",
        "farmerCount": 42
      }];

      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "asc";
      categoryAxis.title.text = "ASC";

      var  valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.title.text = "Producer Society Count";

      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries3D());
      series.dataFields.valueY = "farmerCount";
      series.dataFields.categoryX = "asc";
      series.name = "Producer Society Count";
      series.tooltipText = "{name}: [bold]{valueY}[/]";

      // Add cursor
      chart.cursor = new am4charts.XYCursor();
    },

    mountAFwiseFarmers(){
      /* Create chart instance */
      var chart = am4core.create("chartdivAS2", am4charts.RadarChart);

      /* Add data */
      chart.data = [{
        "afName": "Kamal",
        "farmerCount": 501
      }, {
        "afName": "Saman Kumara",
        "farmerCount": 301
      }, {
        "afName": "Thilakawardhana",
        "farmerCount": 266
      }, {
        "afName": "Dilshan",
        "farmerCount": 165
      }, {
        "afName": "Manoj",
        "farmerCount": 139
      }, {
        "afName": "Kasun",
        "farmerCount": 336
      }, {
        "afName": "Sumith",
        "farmerCount": 290
      }, {
        "afName": "Dewmi",
        "farmerCount": 325
      }, {
        "afName": "Nuwan",
        "farmerCount": 40
      }];

      /* Create axes */
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "afName";
      categoryAxis.renderer.labels.template.location = 0.5;

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.renderer.labels.template.location = 1;
      valueAxis.renderer.labels.template.verticalCenter = "bottom";
      valueAxis.renderer.labels.template.fillOpacity = 0.5;
      valueAxis.renderer.maxLabelPosition = 0.99;

      /* Create and configure series */
      var series1 = chart.series.push(new am4charts.RadarColumnSeries());
      series1.dataFields.valueY = "farmerCount";
      series1.dataFields.categoryX = "afName";
      series1.name = "Farmer Count";
      series1.fontSize = 10;
      series1.strokeWidth = 0;
      series1.columns.template.tooltipText = "Series: {name}\nAF Name: {categoryX}\nCount: {valueY}";
      series1.sequencedInterpolation = true;
      series1.sequencedInterpolationDelay = 100;
      series1.stacked = true;

      // var series2 = chart.series.push(new am4charts.RadarColumnSeries());
      // series2.dataFields.valueY = "value2";
      // series2.dataFields.categoryX = "country";
      // series2.name = "Marketing";
      // series2.strokeWidth = 0;
      // series2.columns.template.tooltipText = "Series: {name}\nCategory: {categoryX}\nValue: {valueY}";
      // series2.sequencedInterpolation = true;
      // series2.sequencedInterpolationDelay = 100;
      // series2.stacked = true;

      /* Add legend */
      chart.legend = new am4charts.Legend();

      /* Add cursor */
      chart.cursor = new am4charts.RadarCursor();

      /* Make chart angled */
      chart.startAngle = -170;
      chart.endAngle = -10;
      chart.fontSize = 10;
      chart.innerRadius = am4core.percent(50);
    },

    dashboardStatisticsDataPreview(){
      let laravel = JSON.parse(window.Laravel);
      const header = {
                'X-CSRF-TOKEN': laravel.csrfToken,
                'X-Requested-With': 'XMLHttpRequest',
                'content-type': 'multipart/form-data',
      };

      axios.post('/api/asW/dashboardStatisticsDataPreview', {userID:laravel.user.depend_dpd_id}, header)
                    .then(response => {
                        if (response.data.http_status == 'success'){
                            this.totalFarmers = response.data.totalFarmers;
                            this.verifiedFarmers = response.data.verifiedFarmers;
                            this.pendingFarmers = response.data.pendingFarmers;
                            this.rejectedFarmers = response.data.rejectedFarmers;
                        }else{
                          this.snackMessage = "Data Load Error.";
                          this.snackColor = "error";
                          this.snackbar = true;
                        }
                    }).catch((error) => {
                      this.snackMessage = error;
                      this.snackColor = "error";
                      this.snackbar = true;

                });
    },




  },
};
</script>
