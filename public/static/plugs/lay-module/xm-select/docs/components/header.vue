<template>
    <div class="headerWrapper">
        <header class="header" ref="header">
            <div class="container">
                <h1>
                    <router-link :to="`/`">
                        <!-- logo -->
                        <slot>
                            <!-- <img src="../assets/images/element-logo.svg" alt="element-logo" class="nav-logo"> -->
                            <!-- <img src="../assets/images/element-logo-small.svg" alt="element-logo" class="nav-logo-small"> -->
							xm-select
                        </slot>
                    </router-link>
                </h1>

                <!-- nav -->
                <ul class="nav">
                    <li class="nav-item">
                        <router-link active-class="active" :to="`/`">使用手册</router-link>
					</li>
					<li class="nav-item">
					    <a href='https://gitee.com/maplemei/xm-select/issues/I1NSO7' target="_blank" style="opacity: 1;">提新需求↗</a>
					</li>

                    <li class="nav-item">
                        <a href='https://gitee.com/maplemei/xm-select' target="_blank" style="opacity: 1; display: flex; margin-top: 30px;">
                            <img src='https://gitee.com/maplemei/xm-select/widgets/widget_3.svg' alt='Fork me on Gitee' style="width: 60px;"></img>
                        </a>
                    </li>
                </ul>
            </div>
        </header>
    </div>
</template>
<script>

    export default {
        data() {
            return {
                active: '',
            };
        },
    };
</script>
<style lang="less" scoped>
    .headerWrapper {
        height: 80px;
    }

    .header {
        height: 80px;
        background-color: #fff;
        color: #fff;
        top: 0;
        left: 0;
        width: 100%;
        line-height: 80px;
        z-index: 100;
        position: relative;

        .container {
            height: 100%;
            box-sizing: border-box;
            border-bottom: 1px solid #DCDFE6;
        }

        .nav-lang-spe {
            color: #888;
        }

        h1 {
            margin: 0;
            float: left;
            font-size: 32px;
            font-weight: normal;

            a {
                color: #333;
                text-decoration: none;
                display: block;
            }

            span {
                font-size: 12px;
                display: inline-block;
                width: 34px;
                height: 18px;
                border: 1px solid rgba(255, 255, 255, .5);
                text-align: center;
                line-height: 18px;
                vertical-align: middle;
                margin-left: 10px;
                border-radius: 3px;
            }
        }

        .nav {
            float: right;
            height: 100%;
            line-height: 80px;
            background: transparent;
            padding: 0;
            margin: 0;

            &::before,
            &::after {
                display: table;
                content: "";
            }

            &::after {
                clear: both;
            }
        }

        .nav-gap {
            position: relative;
            width: 1px;
            height: 80px;
            padding: 0 20px;

            &::before {
                content: '';
                position: absolute;
                top: calc(50% - 8px);
                width: 1px;
                height: 16px;
                background: #ebebeb;
            }
        }

        .nav-logo,
        .nav-logo-small {
            vertical-align: sub;
        }

        .nav-logo-small {
            display: none;
        }

        .nav-item {
            margin: 0;
            float: left;
            list-style: none;
            position: relative;
            cursor: pointer;

            &.nav-algolia-search {
                cursor: default;
            }

            &.lang-item,
            &:last-child {
                cursor: default;
                margin-left: 34px;

                span {
                    opacity: .8;
                }

                .nav-lang {
                    cursor: pointer;
                    display: inline-block;
                    height: 100%;
                    color: #888;

                    &:hover {
                        color: #409EFF;
                    }

                    &.active {
                        font-weight: bold;
                        color: #409EFF;
                    }
                }
            }

            a {
                text-decoration: none;
                color: #1989FA;
                opacity: 0.5;
                display: block;
                padding: 0 22px;

                &.active,
                &:hover {
                    opacity: 1;
                }

                &.active::after {
                    content: '';
                    display: inline-block;
                    position: absolute;
                    bottom: 0;
                    left: calc(50% - 15px);
                    width: 30px;
                    height: 2px;
                    background: #409EFF;
                }
            }
        }
    }

    .nav-dropdown {
        margin-bottom: 6px;
        padding-left: 18px;
        width: 100%;

        span {
            display: block;
            width: 100%;
            font-size: 16px;
            color: #888;
            line-height: 40px;
            transition: .2s;
            padding-bottom: 6px;
            user-select: none;

            &:hover {
                cursor: pointer;
            }
        }

        i {
            transition: .2s;
            font-size: 12px;
            color: #979797;
            transform: translateY(-2px);
        }

        .is-active {

            span,
            i {
                color: #409EFF;
            }

            i {
                transform: rotateZ(180deg) translateY(3px);
            }
        }

        &:hover {

            span,
            i {
                color: #409EFF;
            }
        }
    }

    .nav-dropdown-list {
        width: auto;
    }

    @media (max-width: 850px) {
        .header {
            .nav-logo {
                display: none;
            }

            .nav-logo-small {
                display: inline-block;
            }

            .nav-item {
                margin-left: 6px;

                &.lang-item,
                &:last-child {
                    margin-left: 10px;
                }

                a {
                    padding: 0 5px;
                }
            }

            .nav-theme-switch,
            .nav-algolia-search {
                display: none;
            }
        }
    }

    @media (max-width: 700px) {
        .header {
            .container {
                padding: 0 12px;
            }

            .nav-item {
                a {
                    font-size: 12px;
                    vertical-align: top;
                }

                &.lang-item {
                    height: 100%;

                    .nav-lang {
                        display: flex;
                        align-items: center;

                        span {
                            padding-bottom: 0;
                        }
                    }
                }
            }

            .nav-dropdown {
                padding: 0;

                span {
                    font-size: 12px;
                }
            }

            .nav-gap {
                padding: 0 8px;
            }

            .nav-versions {
                display: none;
            }
        }
    }
</style>
