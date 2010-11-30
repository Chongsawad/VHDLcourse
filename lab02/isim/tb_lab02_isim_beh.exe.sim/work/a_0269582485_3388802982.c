/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x36e8438f */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Documents and Settings/lab02/seg7_decoder.vhd";
extern char *WORK_P_3894910151;



static void work_a_0269582485_3388802982_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    int t10;
    char *t11;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2748);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB14:    t5 = (t0 + 2752);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB15:    t8 = (t0 + 2756);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB16:    t11 = (t0 + 2760);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB17:    t14 = (t0 + 2764);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB18:    t17 = (t0 + 2768);
    t19 = xsi_mem_cmp(t17, t2, 4U);
    if (t19 == 1)
        goto LAB8;

LAB19:    t20 = (t0 + 2772);
    t22 = xsi_mem_cmp(t20, t2, 4U);
    if (t22 == 1)
        goto LAB9;

LAB20:    t23 = (t0 + 2776);
    t25 = xsi_mem_cmp(t23, t2, 4U);
    if (t25 == 1)
        goto LAB10;

LAB21:    t26 = (t0 + 2780);
    t28 = xsi_mem_cmp(t26, t2, 4U);
    if (t28 == 1)
        goto LAB11;

LAB22:    t29 = (t0 + 2784);
    t31 = xsi_mem_cmp(t29, t2, 4U);
    if (t31 == 1)
        goto LAB12;

LAB23:
LAB13:    xsi_set_current_line(66, ng0);
    t1 = ((WORK_P_3894910151) + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 1540);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(46, ng0);
    t32 = ((WORK_P_3894910151) + 672U);
    t33 = *((char **)t32);
    t32 = (t0 + 1584);
    t34 = (t32 + 32U);
    t35 = *((char **)t34);
    t36 = (t35 + 40U);
    t37 = *((char **)t36);
    memcpy(t37, t33, 8U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = ((WORK_P_3894910151) + 740U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = ((WORK_P_3894910151) + 808U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(52, ng0);
    t1 = ((WORK_P_3894910151) + 876U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB7:    xsi_set_current_line(54, ng0);
    t1 = ((WORK_P_3894910151) + 944U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(56, ng0);
    t1 = ((WORK_P_3894910151) + 1012U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB9:    xsi_set_current_line(58, ng0);
    t1 = ((WORK_P_3894910151) + 1080U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = ((WORK_P_3894910151) + 1148U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(62, ng0);
    t1 = ((WORK_P_3894910151) + 1216U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:    xsi_set_current_line(64, ng0);
    t1 = ((WORK_P_3894910151) + 1284U);
    t2 = *((char **)t1);
    t1 = (t0 + 1584);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB24:;
}


extern void work_a_0269582485_3388802982_init()
{
	static char *pe[] = {(void *)work_a_0269582485_3388802982_p_0};
	xsi_register_didat("work_a_0269582485_3388802982", "isim/tb_lab02_isim_beh.exe.sim/work/a_0269582485_3388802982.didat");
	xsi_register_executes(pe);
}
