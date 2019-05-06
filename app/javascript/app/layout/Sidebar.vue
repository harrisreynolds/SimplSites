<template>
    <div class="sidebar">
        <nav class="d-flex">

            <router-link :to="{ name: 'home'}" class="d-flex justify-content-center mt-3 nav-link">

                <div class="p-2 primary-bg rounded-circle home-container">
                    <i class="pt-1 m-1 fas fa-home fa-lg text-primary"></i>
                </div>

            </router-link>

            <router-link :to="{ name: 'components'}" class="d-flex justify-content-center mt-3 nav-link">
                <div class="p-2 warning-bg rounded-circle icon-container">
                    <i class="pt-1 m-1 fas fa-table fa-lg text-warning"></i>
                </div>
            </router-link>

            <router-link :to="{ name: 'analytics'}" class="d-flex justify-content-center mt-3 nav-link">
                <div class="p-2 danger-bg rounded-circle icon-container">
                    <i class="pt-1 m-1 fas fa-chart-line fa-lg text-danger"></i>
                </div>
            </router-link>

            <router-link :to="{ name: 'account'}" class="d-flex justify-content-center mt-3 nav-link">
                <div class="p-2 success-bg rounded-circle">
                    <i class="pt-1 m-1 fas fa-user-circle fa-lg text-success"></i>
                </div>
            </router-link>

        </nav>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                message: "Hello yo yo Harris here!"
            }
        }
    }
</script>

<style scoped>
    .sidebar {
        background: #efefef;
        position: -webkit-sticky;
        position: sticky;
        left: 0;
        top: 0;
        width: 70px;
    }

    nav {
        /*display: flex;*/
        flex-direction: column;
        min-height: 100vh;
    }

    .home-container {
        height: 48px;
        width: 48px;
    }

    .icon-container {
        height: 46px;
        width: 46px;
    }

    .primary-bg {
        background-color: #f3ffff;
    }

    .warning-bg {
        background-color: #ffffe8;
    }

    .danger-bg {
        background-color: #f6e8ea;
    }

    .success-bg {
        background: #eeffee;
    }

    .nav-link:hover {
        text-decoration: none;
    }

    .router-link-active {
        background: #dfdfdf;
    }
</style>
