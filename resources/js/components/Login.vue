<template>
    <div id="app">
        <v-app>
            <v-main
                id="loginPage"
                style="background-image: url('/img/login-image-cover.png'); background-repeat: no-repeat !important;background-size: auto;background-position: center;background-color:#0080FF;"
            >
                <v-container class="fill-height" fluid>
                    <v-row align="center" justify="center">
                        <v-col cols="12" sm="8" md="4"  xs="12" lg="4" xl="4">
                            <v-card  class="mt-3 mx-auto rounded- align-center text-center"  tile >
                                <v-alert style="font-family: Segoe UI !important;font-size: 12px;border-radius:0px !important; width: 100% !important;" v-model="alert" dismissible close-icon="mdi-close-circle-outline" :type="alertType" border="left" elevation="12" :icon="alertIcon">
                                    <strong>{{ alertMessage }}</strong>
                                </v-alert>
                            </v-card>

                            <v-card
                                style=" background-color: rgba(255, 255, 255, 1);"
                                class=" mx-auto rounded- align-center text-center"
                                tile
                            >
                                <v-row class="mt-0 pt-0">
                                    <v-col cols="12" class="mt-0 pt-0">
                                        <v-flex class="text-center mt-0 pt-0" >
                                            <v-card-title class="justify-center mb-1 white--text" style="background-color: #003959 ;">
                                                Climate Smart Irrigated Agriculture Project
                                            </v-card-title>

                                            <h2></h2>

                                        </v-flex>
                                    </v-col>
                                </v-row>

                                <v-card-text>
                                    <v-form
                                        v-model="valid"
                                        ref="form"
                                        action="login"
                                        method="post"
                                    >
                                        <v-text-field
                                            name="_token"
                                            :value="csrf"
                                            v-model="csrf"
                                            v-show="false"
                                        ></v-text-field>
                                        <v-text-field
                                            label="Enter your e-mail address"
                                            v-model="email"
                                            :value="email"
                                            name="email"
                                            dense
                                            outlined
                                            :error-messages="email_errors"
                                            :rules="emailRules"
                                            required
                                        ></v-text-field>
                                        <v-text-field
                                            label="Enter your password"
                                            v-model="password"
                                            :value="password"
                                            name="password"
                                            :error-messages="password_errors"
                                            outlined
                                            dense
                                            min="8"
                                            :append-icon="
                                                e1
                                                    ? 'visibility'
                                                    : 'visibility_off'
                                            "
                                            @click:append="e1 = !e1"
                                            :type="e1 ? 'text' : 'password'"
                                            :rules="passwordRules"
                                            required
                                        ></v-text-field>
                                        <!--<v-checkbox
                                            v-model="rememberMe"
                                            :value="rememberMe"
                                            dense
                                            name="remember"
                                            id="remember"
                                            label="Remember Me"
                                        ></v-checkbox>-->
                                        <v-btn
                                            class="white--text"
                                            small
                                            block
                                            :loading="cardLoader"
                                            @click="submit"
                                            color="blue"

                                            >Sign Me In</v-btn
                                        >

                                        <v-layout> </v-layout>
                                    </v-form>
                                </v-card-text>
                                <v-row class="mt-2">
                                    <v-col cols="12" md="12">
                                        <img
                                            src="/images/main_logo.jpg"
                                            style="width: 100%; height: 100px"
                                            />
                                    </v-col>


                            </v-row>



                            </v-card>

                        </v-col>
                    </v-row>
                </v-container>
            </v-main>
        </v-app>
    </div>
</template>
<script>
export default {
    name: "apilogin",
    component: {

    },
    data() {
        return {
            alert: false,
                alertMessage: '',
                alertType: '',
                alertIcon: '',
            window: {
                width: 0,
                height: 0
            },
            snackbar: false,
            snackColor: "",
            snackMessage: "",
            snackBarRight: false,
            snackBarTop: false,
            valid: false,
            e1: false,
            password: "",
            passwordRules: [v => !!v || "Password is required"],
            emailRules: [
                v => !!v || "E-mail is required",
                v =>
                    /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,5})+$/.test(v) ||
                    "E-mail must be valid"
            ],
            csrf: "",
            email_errors: [],
            password_errors: [],
            cardLoader: false,
            socialLoader: false,
            email: "",
            name: "",
            mobile: "",
            address: "",
            avatar: "",
            myLocation: {
                lat: "",
                lng: ""
            },
            randomPassword: "Abcdef@123",
            header: {},
            rememberMe: false,
        }
    },
    beforeDestroy() {
        clearInterval(this.interval);
    },
    destroyed() {
        window.removeEventListener("resize", this.handleResize);
    },
    mounted() {
        let laravel = JSON.parse(window.Laravel);
            this.csrf =  laravel.csrfToken;
            this.header = {
                'X-CSRF-TOKEN': this.csrf,
                'X-Requested-With': 'XMLHttpRequest',
                'content-type': 'multipart/form-data',
            };
    },
    computed: {},
    watch: {},
    created() {
        window.addEventListener("resize", this.handleResize);
        this.handleResize();
    },
    methods: {
        //---------------------------Handling the user window resize event--------------------------------
        handleResize() {
            this.window.width = window.innerWidth;
            this.window.height = window.innerHeight;
        },
        submit() {
            if (this.$refs.form.validate()) {
                this.checkUserLogin();
            }
        },
        clear() {
            this.$refs.form.reset();
        },
        goBack() {
            this.$router.back();
        },
        //------------check user login------------------------------------------------
        checkUserLogin() {
            this.cardLoader = true;

            axios
                .post(
                    "/api/checkLogin",
                    { email: this.email, password: this.password },
                    this.header
                )
                .then(response => {
                    console.log(response.data);
                    this.cardLoader = false;
                    if (response.data.validate == "success") {
                        // this.snackMessage = "Login successful.Redirecting...";
                        // this.snackColor = "success";
                        // this.snackBarTop = true;
                        // this.snackbar = true;
                        this.alertMessage = 'LOGIN SUCCESS !';
                            this.alertType = 'success';
                            this.alertIcon = 'mdi mdi-thumb-up';
                            this.alert = true;
                        localStorage.setItem(
                            "user",
                            JSON.stringify(response.data.user)
                        );
                        localStorage.setItem(
                            "token",
                            response.data.access_token
                        );
                        this.$refs.form.$el.submit();
                    } else if (response.data.validate == "invalid_email") {
                        this.snackMessage = "Invalid Email";
                        this.snackColor = "error";
                        this.snackBarTop = true;
                        this.snackbar = true;

                        this.alertMessage = 'INVALID EMAIL !';
                            this.alertType = 'error';
                            this.alertIcon = 'mdi mdi-alert';
                            this.alert = true;

                        this.password = "";
                        this.email_errors = [
                            "we cannot find user with this email"
                        ];
                    } else if (response.data.validate == "invalid_password") {
                        this.snackMessage = "Authentication fail";
                        this.snackColor = "error";
                        this.snackBarTop = true;
                        this.snackbar = true;

                        this.password = "";
                        this.password_errors = [
                            "invalid password.try forget password"
                        ];
                    } else {
                        this.snackMessage = response.data.validate;
                        this.snackColor = "error";
                        this.snackBarTop = true;
                        this.snackbar = true;
                        this.password = "";
                    }
                })
                .catch(error => {
                    console.log(error);
                });
        }
    }
};
</script>
